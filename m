From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Kernel 2.6.24, binutils-2.18, and tftplilo on diskless MVME167.
Date: Fri, 14 Nov 2008 22:14:53 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811142153240.31718@loopy.telegraphics.com.au>
References: <OFF2D16A54.2029BAD8-ONCA2574FD.0079BF46-CA2574FE.000FBF52@csc.com>
  <Pine.LNX.4.64.0811111055100.19341@anakin>  <1226611986.4267.16.camel@kars.perseus.home>
  <Pine.LNX.4.64.0811140959120.18881@loopy.telegraphics.com.au>
 <1226656883.21315.4.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="768252030-1031787863-1226660659=:31718"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:47580 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942AbYKNLOz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 14 Nov 2008 06:14:55 -0500
In-Reply-To: <1226656883.21315.4.camel@kars.perseus.home>
Content-ID: <Pine.LNX.4.64.0811142204510.31718@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Kars de Jong <jongk@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen N Chivers <schivers@csc.com.au>, Roman Zippel <zippel@linux-m68k.org>, Andreas Schwab <schwab@suse.de>, Debian GNU/Linux m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--768252030-1031787863-1226660659=:31718
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-ID: <Pine.LNX.4.64.0811142204511.31718@loopy.telegraphics.com.au>



On Fri, 14 Nov 2008, Kars de Jong wrote:

> Preprocessed source stored into /tmp/ccgSA9Qa.out file, please attach this to your bugreport.
> make[1]: *** [net/sunrpc/xdr.o] Error 1
> make: *** [_module_net/sunrpc] Error 2
> 
> I have attached the preprocessed source.

It works for me...

pismo:/tmp$ m68k-linux-gnu-gcc -c ccgSA9Qa.c 
pismo:/tmp$ m68k-linux-gnu-gcc --version
m68k-linux-gnu-gcc (GCC) 4.1.2 20061115 (prerelease) (Debian 4.1.1-21)
Copyright (C) 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

But the version is misleading because I've added and removed patches.
I'll build another one and try and reproduce the bug.

Finn


> 
> Kind regards,
> 
> Kars.
> 
> 
--768252030-1031787863-1226660659=:31718
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII; NAME=gcc-4.0-pr20583.patch
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.64.0811142204190.31718@loopy.telegraphics.com.au>
Content-Description: 
Content-Disposition: ATTACHMENT; FILENAME=gcc-4.0-pr20583.patch

LS0tIGdjYy00LjAuMy9nY2MvY3NlLmMNCisrKyBnY2MtNF8xLWJyYW5jaC9n
Y2MvY3NlLmMNCkBAIC01NTEzLDYgKzU1MTMsMjIgQEANCiAJICAgICAgYnJl
YWs7DQogCSAgICB9DQogDQorCSAgLyogUmVqZWN0IGNlcnRhaW4gaW52YWxp
ZCBmb3JtcyBvZiBDT05TVCB0aGF0IHdlIGNyZWF0ZS4gICovDQorCSAgZWxz
ZSBpZiAoQ09OU1RBTlRfUCAodHJpYWwpDQorCQkgICAmJiBHRVRfQ09ERSAo
dHJpYWwpID09IENPTlNUDQorCQkgICAvKiBSZWplY3QgY2FzZXMgdGhhdCB3
aWxsIGNhdXNlIGRlY29kZV9ydHhfY29uc3QgdG8NCisJCSAgICAgIGRpZS4g
IE9uIHRoZSBhbHBoYSB3aGVuIHNpbXBsaWZ5aW5nIGEgc3dpdGNoLCB3ZQ0K
KwkJICAgICAgZ2V0IChjb25zdCAodHJ1bmNhdGUgKG1pbnVzIChsYWJlbF9y
ZWYpDQorCQkgICAgICAobGFiZWxfcmVmKSkpKS4gICovDQorCQkgICAmJiAo
R0VUX0NPREUgKFhFWFAgKHRyaWFsLCAwKSkgPT0gVFJVTkNBVEUNCisJCSAg
ICAgICAvKiBMaWtld2lzZSBvbiBJQS02NCwgZXhjZXB0IHdpdGhvdXQgdGhl
DQorCQkJICB0cnVuY2F0ZS4gICovDQorCQkgICAgICAgfHwgKEdFVF9DT0RF
IChYRVhQICh0cmlhbCwgMCkpID09IE1JTlVTDQorCQkJICAgJiYgR0VUX0NP
REUgKFhFWFAgKFhFWFAgKHRyaWFsLCAwKSwgMCkpID09IExBQkVMX1JFRg0K
KwkJCSAgICYmIEdFVF9DT0RFIChYRVhQIChYRVhQICh0cmlhbCwgMCksIDEp
KSA9PSBMQUJFTF9SRUYpKSkNCisJICAgIC8qIERvIG5vdGhpbmcgZm9yIHRo
aXMgY2FzZS4gICovDQorCSAgICA7DQorDQogCSAgLyogTG9vayBmb3IgYSBz
dWJzdGl0dXRpb24gdGhhdCBtYWtlcyBhIHZhbGlkIGluc24uICAqLw0KIAkg
IGVsc2UgaWYgKHZhbGlkYXRlX2NoYW5nZSAoaW5zbiwgJlNFVF9TUkMgKHNl
dHNbaV0ucnRsKSwgdHJpYWwsIDApKQ0KIAkgICAgew0KQEAgLTU1NDgsMTYg
KzU1NTUsNiBAQA0KIA0KIAkgIGVsc2UgaWYgKGNvbnN0YW50X3Bvb2xfZW50
cmllc19jb3N0DQogCQkgICAmJiBDT05TVEFOVF9QICh0cmlhbCkNCi0JCSAg
IC8qIFJlamVjdCBjYXNlcyB0aGF0IHdpbGwgYWJvcnQgaW4gZGVjb2RlX3J0
eF9jb25zdC4NCi0JCSAgICAgIE9uIHRoZSBhbHBoYSB3aGVuIHNpbXBsaWZ5
aW5nIGEgc3dpdGNoLCB3ZSBnZXQNCi0JCSAgICAgIChjb25zdCAodHJ1bmNh
dGUgKG1pbnVzIChsYWJlbF9yZWYpIChsYWJlbF9yZWYpKSkpLiAgKi8NCi0J
CSAgICYmICEgKEdFVF9DT0RFICh0cmlhbCkgPT0gQ09OU1QNCi0JCQkgJiYg
R0VUX0NPREUgKFhFWFAgKHRyaWFsLCAwKSkgPT0gVFJVTkNBVEUpDQotCQkg
ICAvKiBMaWtld2lzZSBvbiBJQS02NCwgZXhjZXB0IHdpdGhvdXQgdGhlIHRy
dW5jYXRlLiAgKi8NCi0JCSAgICYmICEgKEdFVF9DT0RFICh0cmlhbCkgPT0g
Q09OU1QNCi0JCQkgJiYgR0VUX0NPREUgKFhFWFAgKHRyaWFsLCAwKSkgPT0g
TUlOVVMNCi0JCQkgJiYgR0VUX0NPREUgKFhFWFAgKFhFWFAgKHRyaWFsLCAw
KSwgMCkpID09IExBQkVMX1JFRg0KLQkJCSAmJiBHRVRfQ09ERSAoWEVYUCAo
WEVYUCAodHJpYWwsIDApLCAxKSkgPT0gTEFCRUxfUkVGKQ0KIAkJICAgJiYg
KHNyY19mb2xkZWQgPT0gMA0KIAkJICAgICAgIHx8ICghTUVNX1AgKHNyY19m
b2xkZWQpDQogCQkJICAgJiYgISBzcmNfZm9sZGVkX2ZvcmNlX2ZsYWcpKQ0K

--768252030-1031787863-1226660659=:31718--
