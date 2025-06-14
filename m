Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE11190685
	for <linux-m68k@vger.kernel.org>; Sat, 14 Jun 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749897598; cv=none; b=T92BySHk3IDKw8MS9S5DHAT2nac2h/XVwMHE0WvrCPTDvxziyJaHO+CDmixL9cdwQVmOhswy1f4cDbnsNmXIrBuMLFtJIpp6loDQTbJW2wndd0Hx62OFbWZa0wGioT9cs8vBlMHttHmH07d9h6rdistzfJaWYB4Y5qzve6rsI9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749897598; c=relaxed/simple;
	bh=R+c6OxZxl9ZfdS82U1VmMX4WH1/++AnVPSXJb0tCOnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RjbcrGQrTWTpGPye7GvKPw2mqukTX/lmmf2LA9cC8eLd91XcTmOWFIx2FLFKdKgn+HKUgQwVhSvSS8+u6A4gH9Xl7bq8r9KBP/0avHbDXJwDM6jUY/C3q9IwZX6GrgDItgqigM9gjJ7bRP2zTRIClUIxkgWlimh8njJsnZE2tiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=c/WAUNAZ; arc=none smtp.client-ip=83.102.40.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="c/WAUNAZ"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id 94A1C2113FE1;
	Sat, 14 Jun 2025 13:39:50 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id q8YgXkSZYuHb; Sat, 14 Jun 2025 13:39:49 +0300 (EEST)
Received: from [192.168.101.100] (87-92-126-133.bb.dnainternet.fi [87.92.126.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id 677002113E1C;
	Sat, 14 Jun 2025 13:39:49 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi 677002113E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1749897589;
	bh=92wccKNjlVa4kjtoV8zjzqQ3GG3gHRcXK2KJTB8nvO0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c/WAUNAZrAryjg14fZ8kRnHG8LVOsMPcNTD5NRcoacdz4ZJijmkNiFwCA6GYLohpL
	 w6JKsIfbd+R7fO7hQZ+koot971m6lLnrTWcoo8L4YnVIwCJe+XX13KDgSNakNfGQOz
	 oHLhYCz16A1pHhuslO8yrJh+Yr7E8WpqwiagEJxRH8YwN6OEMoKcihgwjEa8141scR
	 EgB9+ZzzZU4lEIaHahHHWUYPNeUnUNyXFS3+MMYhuGYrR98Zw73poOshmOVd7se5aF
	 Xdz7oZngRVtZe4UaUbyj4yNRaqAP0iJLXMzmnwWLWSXKuGds/5/XsviTHbMGqKTbJQ
	 V6sk3tqrY/16g==
Message-ID: <edea4668-e052-4071-b307-c3d199108f5d@helsinkinet.fi>
Date: Sat, 14 Jun 2025 13:39:49 +0300
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
 <86c91d1c-cfc6-44c9-8883-d9ae46c3f4c3@helsinkinet.fi>
 <8ccde8667a0d1e005756723af21eebd610868acd.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <8ccde8667a0d1e005756723af21eebd610868acd.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14.6.2025 10.51, John Paul Adrian Glaubitz wrote:
> Here's a list of almost 6000 software packages that build fine on m68k with
> 4 bytes alignment:
> 
> https://cdn.netbsd.org/pub/pkgsrc/packages/NetBSD/m68k/9.0_2023Q4/All/
...
> Exactly my point. It works on NetBSD, so I'm not worried about Linux.

I don't see in above dir e.g. LLVM or Qt, which were in the Debian 
2-byte alignment problems list:
	https://wiki.debian.org/M68k/Alignment

Are those in some other place, do they have other problems besides the 
2-byte alignment, or am I just blind?

(Many other less relevant packages from that Debian list seem also to be 
missing from that NetBSD dir.)


	- Eero

PS. I really appreciate your Debian m68k maintenance effort. As my 
contributions for m68k are elsewhere (Hatari emulator, EmuTOS ROM for 
Atari&Amiga, m68k SW profiling etc), and you were not interested about 
profiling help at this stage, I naturally don't have any say on this.

But note that what Debian (and Gentoo) do, has also wider (indirect) 
impact, so it's definitely of interest also for people who do not use 
them regularly, or don't directly contribute to them, who e.g:

* do contribute to projects that Debian packages

* use only m68k cross-compiler and small subset of m68k packages

* appreciate Debian/Gentoo checking that latest toolchains & OSS SW in 
general support m68k, and bugs are being filed about that
   - those non-Debian people can then also look into / try fix those 
bugs, e.g. when they update their toolchains next...

So please bear with us!
