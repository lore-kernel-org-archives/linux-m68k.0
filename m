From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: aranym bug, manifests as "ida_remove called for id=13" on recent kernels
Date: Mon, 11 Oct 2010 15:10:06 +0200
Message-ID: <m38w243mfl.fsf@hase.home>
References: <20101007174948.GT19804@ZenIV.linux.org.uk>
	<AANLkTin4886D+-yo=zrf2Yj2R5NM9qdRkc3M9cG2rN_F@mail.gmail.com>
	<20101010144952.GF19804@ZenIV.linux.org.uk>
	<AANLkTinuA3AzMoJ82pvCuhmo59DZxL2F1j3xhXUkjj7z@mail.gmail.com>
	<20101010235256.GG19804@ZenIV.linux.org.uk>
	<20101011024103.GH19804@ZenIV.linux.org.uk>
	<20101011043632.GA2566@cynthia.pants.nu>
	<20101011044808.GI19804@ZenIV.linux.org.uk>
	<Pine.BSM.4.64L.1010111218040.23471@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.BSM.4.64L.1010111218040.23471@herc.mirbsd.org> (Thorsten
	Glaser's message of "Mon, 11 Oct 2010 12:21:46 +0000")
Sender: linux-kernel-owner@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Thorsten Glaser <tg@mirbsd.de> writes:

> Mikael Pettersson dixit:
>
>>It's gcc PR41302 which was fixed for gcc trunk on November 4 2009
>>in r153890.  The patch backports easily to gcc-4.4 and solves the
>>test case there (manual inspection using a cross).  It also backports
>
> [x] send unidiff

http://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;a=commitdiff;h=d09fd72c630c4886367f1977cdb366aa82950e32

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
