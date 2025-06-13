Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8826F72608
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845430; cv=none; b=OaXKTFrpe4FLWohDr3tSdycBT8GJqxPgWG0EdkAjnHzxMBoXepdnGRDYqC6Q94Q3mAr+m3GVZclP8s/pZiwEncJme4LXi7Fefz/B42k6nBLkfVskDkQ9qwZKa0JgjJNJbwzry/TLmFxlbkeLhw1pb3YW9Ksqavw4ag23TENISbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845430; c=relaxed/simple;
	bh=CguHf/MAxDgXwNV16ExKtsrAghhb/g6PPsJNsRuUL4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EctUUlWRW0bAksO2KzBAySDgXJ0h7Qu+9KrSkq1+6Q5LjkqeB+5ISEx+1r2pjfJvMzSSAZP4Cv4UlJNsT1hAL5Yqv3vwIOhQKw07nADnM7uInzzbuQlJEGywjBJJmN8ThhCX5uR1eNUtxh5ltOakCPQrJxFQG4RYJDPt3UsCXNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=f+/ZgChB; arc=none smtp.client-ip=83.102.40.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="f+/ZgChB"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id 412D62113E0B;
	Fri, 13 Jun 2025 23:10:24 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id F9XE2lkNt10w; Fri, 13 Jun 2025 23:10:23 +0300 (EEST)
Received: from [192.168.101.100] (78-27-126-206.bb.dnainternet.fi [78.27.126.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id 947F22113E08;
	Fri, 13 Jun 2025 23:10:23 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi 947F22113E08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1749845423;
	bh=/RUHifTVe6SN5c8+BdmczkOXu9Sa88gEsWleTrHsi0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f+/ZgChBwyW7v3Pg4qxSAyl/awAdurP5jNjXjlGZja+LmRRe4XT5PM4R//k231rRc
	 3PeLeuvgNvYIcg/FpyTCbPzxdEJeu9e5lffcn5a8UJ2B4/BH+h8IFVvNpL4zfnce+b
	 nfv94btQQjjH7xcBK/odJeeiFdW7QSnBzGpjowFW3oHrScHyd6fsiaPMLLk26GSvhR
	 k0dv/CvV21uPdpV3aifAqdypouRoYO+9GE8fvCXRQBWub0B0p/mFKFPYdyOeVyoOKk
	 0gAYMKHANXeXwgCgjL7fWQNBqWIcXJD2nYH15IaQJHedvdth8hFL0yfeEatUYAz9jX
	 sR3SRqnw3OQ+Q==
Message-ID: <19d8cd93-2289-4063-b020-f97b3f9db5ff@helsinkinet.fi>
Date: Fri, 13 Jun 2025 23:10:23 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Debian boot/login time
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Stan Johnson <userm57@yahoo.com>
Cc: Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
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
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi>
 <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de>
 <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi>
 <6c9b49aaab26bd7fda7a95e7e0c5392b26abbcb4.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <6c9b49aaab26bd7fda7a95e7e0c5392b26abbcb4.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

(Updated subject.)

On 13.6.2025 14.22, John Paul Adrian Glaubitz wrote:
> On Thu, 2025-06-12 at 17:54 +0300, Eero Tamminen wrote:
>> (Full m68k Debian is too heavy to boot in reasonable time on machines
>> that Hatari emulates, due to missing crypto acceleration, but IMHO also
>> unnecessary for kernel ABI change discussions.)

Note that above is about Debian defaults.  What one gets before being 
able to locate, disable and configure every option and service that 
makes things crawl (and build own kernel more optimal for that setup).


> Last time I booted Debian/m68k on my Amiga 68060 it booted fine. It took
> a few minutes but that's not surprising given the machine has only 50 MHz.

It's few years since I tried it, but I was testing on (emulated) 030 @ 
32Mhz [1] which is quite a bit slower than your setup, and I included 
logging into console to "booting Debian".

When Debian changed encryption default from MD5 to SHA512, login time 
exploded. If I don't completely misremember, it took something like 20 
min.  Switching PAM back to MD5 helped a lot with login.

Debian has switched to "yescrypt" since then, which I assume to be even 
slower default. :-)

=> It's hard for me to image somebody even trying to use something like 
KDE, Gnome or Libreoffice on m68k HW, even fast FPGA ones.


	- Eero

[1] Hatari can emulate up to 060 @ 32Mhz, but 060 emulation did not work 
with Linux when I did that testing.  It does now, but unlike with 030, 
only if one disables d/i-cache emulation...

(My Google-Foo may be lacking, but at least I did not find any guide / 
wiki helping to optimize Debian for such slow setup, so I gave up, as I 
had other issues to investigate / solve.)
