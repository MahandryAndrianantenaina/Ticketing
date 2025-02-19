<%
    Exception ex = (Exception) request.getAttribute("exception");
    String previous = (String )request.getAttribute("previous");
%>
<%
    if (ex != null) {
        Swal.fire({
            icon: 'error',
            title: 'Erreur Interne Serveur',
            text: '<%= ex.getMessage()%>',
            showCancelButton: true,
            cancelButtonText: 'Détails',
            cancelButtonColor: '#FFA500',
            confirmButtonText: 'OK'
        }).then((result) => {
            if (result.dismiss === Swal.DismissReason.cancel) {
                Swal.fire({
                    icon: 'info',
                    title: 'Détails de l\'erreur',
                    text: '<% ex.printStackTrace(new java.io.PrintWriter(out));%>',
                    confirmButtonText: 'OK'
                }).then((res) => {
                    if (res.isConfirmed) {
                        window.location.href = "<%=previous%>"; 
                    }
                });
            }else if (result.isConfirmed) {
                window.location.href = "<%=previous%>";
            }
        });
    }
%>
