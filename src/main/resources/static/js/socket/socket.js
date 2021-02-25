function MySocket(url) {
    this.websocket = new WebSocket(url);
    this.url = url;
    this.data = {
        req : {
            message : "",
        },
        res : {
            message : "",
        }
    };
    this.param = {

    };
    this.methods = {
        default : {
            onerror : ()=>{
                setMessageInnerHTML("error");
                var callback = this.methods.callback.onerror;
                if (callback!=undefined&&callback!=null){
                    callback();
                };
            },
            onopen : (event)=>{
                setMessageInnerHTML("open");
                var callback = this.methods.callback.onopen;
                if (callback!=undefined&&callback!=null){
                    callback();
                };
            },
            onmessage : (event)=>{
                setMessageInnerHTML(event.data);
                var callback = this.methods.callback.onmessage;
                if (callback!=undefined&&callback!=null){
                    callback();
                };
            },
            onclose : ()=>{
                setMessageInnerHTML("close");
                var callback = this.methods.callback.onclose;
                if (callback!=undefined&&callback!=null){
                    callback();
                };
            }
        },
        callback : {
            onerror : ()=>{

            },
            onopen : ()=>{

            },
            onmessage : ()=>{

            },
            onclose : ()=>{

            }
        }
    }

    this.websocket.onerror = this.methods.default.onerror();
    this.websocket.onopen = this.methods.default.onopen(event);
    this.websocket.onmessage = this.methods.default.onmessage(event);
    this.websocket.onclose = this.methods.default.onclose();

    window.onbeforeunload = function () {
        this.websocket.close();
    }

    function getMessage(message) {
        alert("消息来了！");
        console.log(message);
    }

    function sendMessage(message) {
        this.websocket.send(message);
    }

    function closeWebSocket() {
        this.websocket.close();
    }
}