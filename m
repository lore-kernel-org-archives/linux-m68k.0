Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0571A2905
	for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731573242; cv=none; b=q5TBFdUf4N+LLzgBSG9xLa7mjrwq7DUPOL/wgYYfM6LWZQGDoShIN2/VB1+7d0B6rj7RgUNRfOcTPUtlCruS9nUS8ijYoe7uuK6IMs0cG+YWY7RseY9j0Lsa4bfv5e2WgE1/EFtI2LDMw7a3UOlcENbecKlGaCtqZ87IC9Qt7U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731573242; c=relaxed/simple;
	bh=r/zlERiAsQHphr1KW80Vq6NID9t9sqpXoi6MozUMpTw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JJvpVuNbjtaAzQFISJK1zPHIzH2+k9t3EnM858hswmK9JzHv+HF4jYasAD3gq+sqXN+1wjRtkdgFU2hp+h/Fxbh+CQ+atmnkPB2XmwiiSjPlnqhq5Kgh8mVITbBtuENDGoA4ICeV2E0ZHsBvJrS9a7G2Wp8ja26t+2Te1fDX37E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=n6VjQL7q; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="n6VjQL7q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QZyoxEukRNLxhlx/MrtNfXPZJvaDBRZ1jpG/LHwCyU4=; t=1731573239; x=1732178039; 
	b=n6VjQL7qKfTrY6NQgN/2VJVLL0YGtGosDHTUOj1Lj4k8+E9gMj1OSY8vdIRmPAl7/7M26q5alM8
	VDkSBkjImgQSsvkvMyOxFP8X97upvCT7jJMB/2ipYCnEpFIPVOlFmz1oYUO+0KrIVSWBjA0rxzRwM
	pxwIkaSImcmb8kvgi4bk+ogt6DtJu90LT7Sp5kV7L1qbjMXQmZQpSv5PSfAj8Qax7gC/MP5VSJVUq
	q1yrriZvE602YkuGWs55g3NROB0PhmpsZvxXzYArRMdlRcUIBOQol//Ij+BAiPV+gSGdmtbBpW4WY
	hN9Rlu9EElxonAHOKgQBVy1HxUYMZGHgUMaQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tBVIb-00000000faG-01ym; Thu, 14 Nov 2024 09:33:57 +0100
Received: from p57bd904e.dip0.t-ipconnect.de ([87.189.144.78] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tBVIa-00000003Q7n-3Mlc; Thu, 14 Nov 2024 09:33:56 +0100
Message-ID: <a81811c00be327ace077cef6542e50951242ce5b.camel@physik.fu-berlin.de>
Subject: Re: Python 3.13 segfaulting on m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-68k <debian-68k@lists.debian.org>
Cc: linux-m68k <linux-m68k@vger.kernel.org>
Date: Thu, 14 Nov 2024 09:33:56 +0100
In-Reply-To: <ce3b2551ca4eaec7e732c08037aba1dd073694ca.camel@physik.fu-berlin.de>
References: 
	<ce3b2551ca4eaec7e732c08037aba1dd073694ca.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

On Wed, 2024-11-13 at 15:14 +0100, John Paul Adrian Glaubitz wrote:
> does anyone have a solution on how to fix Python 3.13 with 2-byte alignme=
nt?

This is the backtrace:

(gdb) r
Starting program: /home/glaubitz/python3.13-3.13.0/build-static/_bootstrap_=
python ../Programs/_freeze_module.py abc ../Lib/abc.py Python/frozen_module=
s/abc.h

Program received signal SIGSEGV, Segmentation fault.
0x801c56d0 in _PyGCHead_NEXT (gc=3D0x85f0b6c0) at ../Include/internal/pycor=
e_gc.h:175
175         uintptr_t next =3D gc->_gc_next;
(gdb) bt
#0  0x801c56d0 in _PyGCHead_NEXT (gc=3D0x85f0b6c0) at ../Include/internal/p=
ycore_gc.h:175
#1  update_refs (containers=3D0x804eb4f2 <_PyRuntime+50314>) at ../Python/g=
c.c:396
#2  deduce_unreachable (unreachable=3D0xefffecc8, base=3D0x804eb4f2 <_PyRun=
time+50314>) at ../Python/gc.c:1086
#3  gc_collect_main (tstate=3D0x80502b22 <_PyRuntime+146106>, generation=3D=
0, reason=3D_Py_GC_REASON_HEAP) at ../Python/gc.c:1360
#4  0x801c6e06 in _Py_RunGC (tstate=3D0x80502b22 <_PyRuntime+146106>) at ..=
/Python/gc.c:1837
#5  0x801ce9ac in _Py_HandlePending (tstate=3D0x80502b22 <_PyRuntime+146106=
>) at ../Python/ceval_gil.c:1296
#6  0x80012936 in _PyEval_EvalFrameDefault (tstate=3D0x80502b22 <_PyRuntime=
+146106>, frame=3D0xc0025238, throwflag=3D0) at ../Python/generated_cases.c=
.h:1364
#7  0x8019689e in _PyEval_EvalFrame (throwflag=3D0, frame=3D<optimized out>=
, tstate=3D<optimized out>) at ../Include/internal/pycore_ceval.h:119
#8  0x800694b8 in _PyFunction_Vectorcall (func=3D0xc02c2208, stack=3D0xefff=
eed4, nargsf=3D2, kwnames=3D0x0) at ../Objects/call.c:413
#9  0x80068e54 in _PyObject_VectorcallTstate (kwnames=3D0x0, nargsf=3D2, ar=
gs=3D0xefffeed4, callable=3D0xc02c2208, tstate=3D0x804ba000) at ../Include/=
internal/pycore_call.h:168
#10 object_vacall (tstate=3D0x80502b22 <_PyRuntime+146106>, base=3D0x0, cal=
lable=3D0xc02c2208, vargs=3D<optimized out>) at ../Objects/call.c:819
#11 0x80069d8e in PyObject_CallMethodObjArgs (obj=3D0x0, name=3D0x804e4ed4 =
<_PyRuntime+24172>) at ../Objects/call.c:880
#12 0x801d6a06 in import_find_and_load (abs_name=3D0xc02e83e0, tstate=3D0x8=
0502b22 <_PyRuntime+146106>) at ../Python/import.c:3683
#13 PyImport_ImportModuleLevelObject (name=3D0xc02e83e0, globals=3D0xc02f59=
60, locals=3D0xc02f5960, fromlist=3D0xc02e81e8, level=3D0) at ../Python/imp=
ort.c:3765
#14 0x8018f218 in builtin___import___impl (level=3D0, fromlist=3D0xc02e81e8=
, locals=3D0xc02f5960, globals=3D0xc02f5960, name=3D0xc02e83e0, module=3D<o=
ptimized out>)
    at ../Python/bltinmodule.c:277
#15 builtin___import__ (module=3D0xc02a25f0, args=3D<optimized out>, nargs=
=3D5, kwnames=3D0x0) at ../Python/clinic/bltinmodule.c.h:107
#16 0x800c436c in cfunction_vectorcall_FASTCALL_KEYWORDS (func=3D0xc02a2668=
, args=3D0xeffff01c, nargsf=3D5, kwnames=3D0x0) at ../Objects/methodobject.=
c:441
#17 0x800690ec in _PyObject_VectorcallTstate (kwnames=3D0x0, nargsf=3D<opti=
mized out>, args=3D0xeffff01c, callable=3D0xc02a2668, tstate=3D0x80502b22 <=
_PyRuntime+146106>)
    at ../Include/internal/pycore_call.h:168
#18 _PyObject_CallFunctionVa (tstate=3D0x80502b22 <_PyRuntime+146106>, call=
able=3D0xc02a2668, format=3D0x8033e43e "OOOOi", va=3D0xeffff05c) at ../Obje=
cts/call.c:552
#19 0x80069662 in PyObject_CallFunction (callable=3D0xc02a2668, format=3D0x=
8033e43e "OOOOi") at ../Objects/call.c:574
#20 0x801d72ee in PyImport_Import (module_name=3D0xc02e83e0) at ../Python/i=
mport.c:3950
#21 0x801d7586 in PyImport_ImportModule (name=3D0x8033a447 "encodings") at =
../Python/import.c:3390
#22 0x8019a866 in _PyCodec_InitRegistry (interp=3D0x804ea654 <_PyRuntime+46=
572>) at ../Python/codecs.c:1505
#23 0x80143b3a in _PyUnicode_InitEncodings (tstate=3D0x80502b22 <_PyRuntime=
+146106>) at ../Objects/unicodeobject.c:15755
#24 0x801f3246 in init_interp_main (tstate=3D0x80502b22 <_PyRuntime+146106>=
) at ../Python/pylifecycle.c:1200
#25 0x801f3624 in pyinit_main (tstate=3D0x0) at ../Python/pylifecycle.c:137=
4
#26 pyinit_main (tstate=3D0x80502b22 <_PyRuntime+146106>) at ../Python/pyli=
fecycle.c:1363
#27 0x801f489e in Py_InitializeFromConfig (config=3D<optimized out>) at ../=
Python/pylifecycle.c:1405
#28 0x80009d10 in main (argc=3D5, argv=3D0xeffff4a4) at ../Programs/_bootst=
rap_python.c:94
(gdb)

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
