Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7976721B9F6
	for <linux-m68k@vger.kernel.org>; Sun, 22 Jun 2025 22:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750630868; cv=none; b=B8QvSwqB11ndfpRL8PF/5j47dSi2nTyrMEAMNBI0UTCAgIsq9pdLP21wZhR6QnYcUBJ89jvyPbPl2ftdeeAuzMcBY3gyl4JkDTjx1rytGyEYnQJBFjpCxc9g3jK4yDoR/64EfHQAuutGj37KrUe7MerkzAu4EF7r3p7xM/Ll8WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750630868; c=relaxed/simple;
	bh=lKygBekeeW3pti+YAf46QxotNVY4TLFBLbIL+FbPe3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VFL1/9evFNVeyePval/sEJ/i5aa+g8PhPfoPOKLBiL4mociuG0ImvR+YThJFwYkRJoPD0S/lLrpljke/idDkgim+kOLgKgjGWOzJ0LDCd6M8mSzHstt0NBRcctxVMJ0GzmMtbh0AhA8ty+WijvBhCJPWUU3njGJerg5+WRL39B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=bv9tg/4i; arc=none smtp.client-ip=83.102.40.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="bv9tg/4i"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id C5D432113FEC;
	Mon, 23 Jun 2025 01:13:15 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Uy3Ta-xVJtmu; Mon, 23 Jun 2025 01:13:14 +0300 (EEST)
Received: from [192.168.101.100] (78-27-119-49.bb.dnainternet.fi [78.27.119.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id 16D322113FEB;
	Mon, 23 Jun 2025 01:13:13 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi 16D322113FEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1750630394;
	bh=PGYnxTui91ewvKm6QxSnXbJsmCUlJNj2ajoySNbywu0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bv9tg/4iQY/YokaEQ8lcN8RsZa4CpNErb1ZZ0Mg7PeRh40k6omle60pv8ac1OA5iI
	 EM3i5eedKwkSw03NYlaPNeolmEeF9m7XBLjK2aiwoAWhALuYHUVXGhGl6vQKlivbg+
	 FvKqyzD1eBZcKFM4MTGtYnUaGlptJObFMLrMmvBs1pNHqWN6ypwtSK3ji59DEevhH2
	 0nV1K0Scp2vvdhbA6bTW09owwbmjifLzr74yH0YtIWhhlgS8tX+xd7kD+k4qGH6F8I
	 S/jnr+k1Hjslvik8IWTTzFnuh+TvZfFMMHkYOlK2i1LKzSqnd6b0F19yX3Ntp4aQcK
	 vx38xTlmMpNeQ==
Message-ID: <17105089-d9dc-4a87-b531-e47989aa765f@helsinkinet.fi>
Date: Mon, 23 Jun 2025 01:13:08 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Preliminary results - was: Re: Question on BIGGEST_ALIGNMENT in
 GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "port-m68k@netbsd.org" <port-m68k@netbsd.org>,
 "debian-68k@lists.debian.org" <debian-68k@lists.debian.org>,
 "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>
 <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
 <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
 <CAMuHMdU7Px7bT4XCZC=vF6aUFGj8=cd=refOf2u17mRjp2FUSA@mail.gmail.com>
 <2c10a9539a82b534e4a815361bb24c04d30b7e67.camel@physik.fu-berlin.de>
 <CAMuHMdXnebgBVWp-uxrmxTFKZkQVU2h-OW7H+7hJ+4beN9DFLg@mail.gmail.com>
 <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <9f1613138de30db0248649e6a36c2b063693057f.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16.6.2025 18.39, John Paul Adrian Glaubitz wrote:
> To summarize:
> 
> - the ELF header provides provides the e_ident and e_flags fields which could be
>    used for identifying a Linux/m68k system using the 4 bytes alignment ABI
> - MIPS uses e_flags for differentiating its ABIs
> - PA-RISC sets e_ident to 0x03 (Linux) while every other arch uses 0x00 (SysV ABI)
> - qemu-user needs to be patched to deal with the changed alignment (include/user/abitypes.h)
> - the kernel needs to be patched to deal with the changed alignment (arch/m68k/kernel/signal.c)
> - NetBSD uses an emulation layer which allows 2 bytes alignment a.out executables on an
>    ELF system with 4 bytes alignment

So Linux could eventually have similar emulation layer for 2-byte 
aligned ELF binaries (I don't see point in a.out support)?

> - glibc needs to be patched in sysdeps/m68k/utmp-size.h
> - gcc needs to be patched in gcc/config/m68k/linux.h (BIGGEST_ALIGNMENT to 64, EMPTY_FIELD_BOUNDARY
>    and STACK_BOUNDARY to 32, see netbsd-elf.h)
> - the glibc and gcc testsuites should be run in a 4 bytes alignment to check for regressions
> 
> Anything else I'm missing?

- ELF loaders for kernel, its modules and user-space need to be patched 
to reject ELF binaries with wrong ELF flags
- Full test-suites run also for other important projects which e.g. 
include m68k / CF asm code
- Changes tested to work as expected _both_ with 2- and 4-byte alignment 
builds
?


On 18.6.2025 15.27, John Paul Adrian Glaubitz wrote:
 > On Wed, 2025-06-18 at 22:21 +1000, Greg Ungerer wrote:
 >> The bulk of the instruction set is the same. Asm code will look totally
 >> familiar to anyone who knows m68k :-)   One notable difference is that
 >> there is a more limited set addressing modes for some instructions.
 >
 > True, but you won't be able to run any classic m68k binaries on ColdFire
 > and the other way around, are you?

Besides binaries that use just the common instruction subset between 
m68k / CF, the individual m68k instructions can be emulated, or whole 
program can be run under m68k emulation (something more light-weight 
than user-qemu).  See e.g. ACP:
https://en.wikipedia.org/wiki/Atari_Coldfire_Project#Compatibility

It all depends on how much there's value in running older binaries which 
have no sources available, or haven't been rebuild for some other 
reason.  On ACP there was more reason than on Debian...


	- Eero

