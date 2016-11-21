jQuery ->
    $('#calcTss').click ->
        weight = $('#inputWeight').val()
        power = $('#inputPower').val()
        duration = $('#inputDuration').val()
        intensity = $('#inputIntensity').val()

        ftp = Math.round(power * 0.95)
        $('#ftp').html(ftp)

        wkg = Math.round(((ftp / weight) * 100))/100
        $('#wkg').html(wkg)

        normalized = Math.round(ftp * intensity)
        $('#normalized').html(normalized)

        imtss = Math.round(((duration* 3600 * normalized * intensity) / (ftp * 3600)) * 100)
        $('#imtss').html(imtss)

        $('.slider').slider()
        
        if imtss < 270
            $('#imtss').css('color', '#3498db')
        else if (imtss > 270 && imtss < 280)
            $('#imtss').css('color', '#16a085')
        else if (imtss > 280 && imtss < 300)
            $('#imtss').css('color', '#2ecc71')
        else if (imtss > 300)
            $('#imtss').css('color', '#c0392b')