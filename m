Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAAC224AE0
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 19:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842967; cv=none; b=qTb8QHlwu90DeHFYNpXa6tI8Wqg1fWmsqiKPh47gMsPA59gC4+abQ+XdpwM2HhEgSrlInjs213p3iv0sHelOOYCBIS56FpnRokejfE0/RgaUyk67uz2xaMxA2hRYG+IpCotofBX/Yglw6zu9YMlYygnzRvseYBsudvGWjswIsOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842967; c=relaxed/simple;
	bh=5yqJ7qhf3U4fvrDloBbFtsDcH3jHzyYDH7UuEcJ7eiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nU+ByUTJEbiG0jpX/6VI3TU8jHsKWSTbzduatbsi5Thab2Si6WUYLAQwM0363bjOtdTuuVbnMIgR13f7SUzB7nKkLOrWq7hiqfwX0kwRwEdiwMbSOI9kDUda6+rRt7RsamqPGdBUYpOOgGlVB9a3ViIi7oshJqBOXOwatHDMhi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=jR9Q9LWP; arc=none smtp.client-ip=83.102.40.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="jR9Q9LWP"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id E29032113FEB;
	Fri, 13 Jun 2025 22:29:18 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id z4KVfFjTBqke; Fri, 13 Jun 2025 22:29:18 +0300 (EEST)
Received: from [192.168.101.100] (78-27-126-206.bb.dnainternet.fi [78.27.126.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id B2CB12113FEA;
	Fri, 13 Jun 2025 22:29:17 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi B2CB12113FEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1749842957;
	bh=BEsxBaXZZBy04js64NuQunxBOTxX/3WDtOCkKYIh718=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jR9Q9LWPl8E6RvoTZMeiIlS78T/RFJkZwWHO/lPD10jkSB+ZPUAfTS1M4hpXuTnvE
	 vWMHboKE77r660xHNz8pBQgcr+hJAq0e1/xyE7ZGZY5008bXApY+vDRRSBgwAQyFbh
	 rEClDu4xTIKOMQDflemv54Wik7zXeDfanFWSFFEIdF22FL0tgcajDQRsOiLEXOx+Z9
	 xxDmxNT9ifHOzEYz/e4nQPlW1YfLrW9ikHwteaA2FQLgcX15iTYXUNNmIY0h3G8VhO
	 gJNanu8Gtg/tRkk688NMGEWdkK2LetFRa+6YEpiSvZAhZ2NY9g86hsWJlU76X6k02O
	 lJsSScqxdYTQA==
Message-ID: <86c91d1c-cfc6-44c9-8883-d9ae46c3f4c3@helsinkinet.fi>
Date: Fri, 13 Jun 2025 22:29:17 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13.6.2025 17.53, John Paul Adrian Glaubitz wrote:
> On Fri, 2025-06-13 at 17:15 +0300, Eero Tamminen wrote:
>> Wouldn't next upgrade completely break user's Debian system so it needs
>> complete re-install?
> 
> You would need to extract the glibc package manually from my tests. After that,
> upgrading the system should be possible.

I think quite a bit more binaries than just Glibc are needed for Debian 
upgrade tooling to work, but OK.

As to other potential issues...

I assume there are no m68k port packages with closed source executable 
code (FW) [1], like the other architectures (esp. x86) have & need, and 
that any code intended to work also on non-m68k platform, should be fine 
with 4-byte alignment.

But what about m68k specific C/C++ and assembly code that may hard-code 
2-byte alignment assumptions; is there any tooling to detect (potential) 
alignment issues in those?

Or is the plan just to rely on packages' self-tests to reveal issues, 
and then track them down from there?


[1] Are sources for "bootstra.tos" & "amiboot" anywhere, in case they 
need updates:
https://wiki.debian.org/M68k/Installing
https://people.debian.org/~wouter/d-i/images/20130502-06:51/tools/atari/
https://people.debian.org/~wouter/d-i/images/20130502-06:51/tools/amiga/
?


>> If true, would separate m68k arch for 4-byte alignment be out of
>> question, similarly how there have been different ARM arch variants?
> 
> Creating a separate arch would mean patching various parts of Debian which
> again would involve a lot of work which I don't think is worth the effort.
...
> That's why I want to make a hard cut and not invest months of work when the
> userbase consists of just a few people.

Ok, fair enough.

Are there any statistics on how many Debian packages do (still) include 
m68k assembly?

If that number is limited enough, it could help in getting other people 
to review the assembly code for potential alignment issues...

Glibc is likely on top of that list (but also most likely to be 
alignment neutral):
	glibc$ find -name '*.S' | grep m68k | wc -l
	25

As *BSD already uses 4-byte alignment, I assume that for packages 
containing m68k assembly that do support / work also on *BSD in addition 
to Linux, m68k asm code used on both should work fine, and one needs to 
review only m68k asm that differs on Linux.

(I'm thinking of acceleration code, not syscall bindings, those I guess 
to differ anyway between the OSes.)


	- Eero

