c.NotebookApp.tornado_settings = {
    'headers': { 
        'Content-Security-Policy': "frame-ancestors tramberend.beuth-hochschule.de localhost:* http: https: 'self';"
        }
    }
c.JupyterHub.tornado_settings = {
    'headers': { 
        'Content-Security-Policy': "frame-ancestors tramberend.beuth-hochschule.de localhost:* http: https: 'self';"
        }
    }
c.BinderHub.tornado_settings = {
    'headers': { 
        'Content-Security-Policy': "frame-ancestors tramberend.beuth-hochschule.de localhost:* http: https: 'self';"
        }
    }
