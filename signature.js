const signature = {
    pad: "",
    result: "",
    img_result: "",
    submit: "",
    clear: "",
    camera: "",
    snapshot: "",
    img: "",
    init: function() {
        const result = this.result;
        const img_result = this.img_result;
        let img = this.img;
        // init signaturepad
        var signaturePad = new SignaturePad(document.getElementById(this.pad), {
                backgroundColor: 'rgba(255, 255, 255, 0)',
        penColor: 'rgb(0, 0, 0)'
        });
    
        // get image data and put to hidden input field
        function getSignaturePad() {
            var imageData = signaturePad.toDataURL('image/png');
            $(result).val(imageData)
            $(img_result).attr('src',"data:"+imageData);
        }
    
        // form action
        $('#save').click(function() {
            getSignaturePad();
            return false; // set true to submits the form.
        });
    
        // action on click button clear
        $('#clear').click(function(e) {
            e.preventDefault();
            signaturePad.clear();
        })
        
        //CAMERA
        // CAMERA SETTINGS.
        Webcam.set({
            width: 120,
            height: 120,
            image_format: 'jpeg',
            jpeg_quality: 1
        });
        Webcam.attach(this.camera);
        
        // SHOW THE SNAPSHOT.
        // A button for taking snaps
        takeSnapShot = function () {
            // take snapshot and get image data
            Webcam.snap(function (data_uri) {
                console.log(data_uri);
                generateQR(data_uri, img);
            });
        }
    },

    upload_signqr: function (e) {
        e.preventDefault();
        if(!document.querySelector(this.img_result).src.includes('data:image')) {
            alert("Tanda tangan harus diisi");
            return null
        }

        if ($("#gambar").val() == '') {
            alert("Harus mengambil foto!");
            return null
        }     
        
        const data = new FormData();
        const image = document.querySelector(this.img_result);
        const file = dataURLtoFile(image.src, "signature.png")
        const image_qr = $("#gambar").val();
        const file_qr = dataURLtoFile(image_qr, "qr.png")

        data.append("signature", file);
        data.append("id_kegiatan", $("#id_kegiatan").val());
        data.append("qrcode", file_qr);

        $.ajax({
            type:'POST',
            url: e.target.action,
            data,
            cache:false,
            contentType: false,
            processData: false,
            success:function(data){
                console.log(data);
                data = JSON.parse(data);
                const message = `<div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Success: ${data.message}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>`;
                $(".alert-message").html(message);
            },
            error: function(data){
                console.log("error");
                console.log(data);
            }
        });
    }
}

function dataURLtoFile(dataurl, filename) {
    var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
    bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
    while(n--){
        u8arr[n] = bstr.charCodeAt(n);
    }
    return new File([u8arr], filename, {type:mime});
}

const generateQR = (data_uri, img) => {
    const payload = `{
        id: ${$("#id_kegiatan").val()},
        link: "http://localhost:8000/verify.php?id=${$("#id_kegiatan").val()}",
        foto: ${data_uri}
        
    }`;
     $.ajax({
        type: "POST",
        url: `https://api.qrserver.com/v1/create-qr-code/?size=250x250&data=${payload}`,
        xhr:function(){// Seems like the only way to get access to the xhr object
            var xhr = new XMLHttpRequest();
            xhr.responseType= 'blob'
            return xhr;
        },
        success: async function(response) {
            const img_qr = document.getElementById(img);
            var url = window.URL || window.webkitURL;
            img_qr.src = url.createObjectURL(response);
            const gambar = await blobToBase64(response);
            $("#gambar").val(gambar)
        },
    });
}

const blobToBase64 = (blob) => {
    return new Promise((resolve, _) => {
      const reader = new FileReader();
      reader.onloadend = () => resolve(reader.result);
      reader.readAsDataURL(blob);
    });
}
