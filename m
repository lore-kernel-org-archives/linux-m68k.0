Received: from smtp.dnamail.fi (sender103.dnamail.fi [83.102.40.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA4517597
	for <linux-m68k@vger.kernel.org>; Wed, 11 Jun 2025 15:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656469; cv=none; b=EPObEnJ2zPP6klzcXmhx1QPcS8lEXFU1/fFjzQn+lUs9TEVrJbgNJY/omN2RlrhLU/lBTA7PTYbkSQaDxAJ7Y9RVilO6jWxuWhEl383zL6auLjuNvUwgkx3zDcC2fuBSGVoo8X0MTJrcs+t2y52tRyt2TLBZB6MmcXS9edU9JJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656469; c=relaxed/simple;
	bh=3vXW11SDLcbQTYXid250UEiddCBVSzcxzOHSeaXJF3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWlFbxELuCZ/K7Pq05DMw3t0rEy8vYO2PnN617Qzc3y4KAnBmdS0HjEspjKG6ak6q8voFD/dY0jO0AXWM4tlA4DSLPOBndXHjDka9aXBfx2gO9UZo5n3No2CdeYfVBg2MrawOioszAI64bRSJLIhFiVeUR+YdfBbUhT2SC8LvW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=kS/jd5/6; arc=none smtp.client-ip=83.102.40.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="kS/jd5/6"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id 1610A4098E95;
	Wed, 11 Jun 2025 18:32:35 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.157])
 by localhost (dmail-psmtp02.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id ilHn58AroDtG; Wed, 11 Jun 2025 18:32:34 +0300 (EEST)
Received: from [192.168.101.100] (87-92-125-210.bb.dnainternet.fi [87.92.125.210])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id 01FD8408850A;
	Wed, 11 Jun 2025 18:32:33 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi 01FD8408850A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1749655954;
	bh=2EJbWb9oF7krvYB3QVEmg5xHrUFyQqMyptyTQqwsJrw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kS/jd5/6C/ylgO0SIkkTzmjUVNvvynyJsmcgzJaHzKvx4yKNrv2taoRZCG0NlRyOf
	 ImgZ2EUvVEaf+n02bvMIWnHGGxKtzqr5FtzMev9IDfUoq4LfZkygk/0gv7EctnhGkG
	 Bl+CYvydQfHx8XmdZQbaSodL8OXHl2+8ivbHSu/5HLuaGSQxfJK80SB+bMalmll7RT
	 iPWwOS97rtcLsOp/mmbI2i7wNK/KaQIJSRQKxXVOgNObx3L8BWLe1KOQTqXxLATZdB
	 X3oysJXOJonpkKcWY0alaS3wogHck/Kn/LehpqdaIdaeQWI3vsnPG/ZH0+to844ie5
	 4Ge5Q3x3ohnaQ==
Message-ID: <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi>
Date: Wed, 11 Jun 2025 18:32:33 +0300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Stan Johnson <userm57@yahoo.com>
Cc: Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
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
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11.6.2025 10.44, John Paul Adrian Glaubitz wrote:
> As previously stated, NetBSD uses 4 bytes alignment and runs fine even on
> 68010-based systems. In fact, using a 4 bytes alignment will actually
> improve performance as it's the natural alignment the hardware uses.

It will decrease performance if increased alignment means that something 
that fit earlier into i/d-cache, does not fit any more.

(68030 has 256 bytes, 68040 has 4 KB, and 68060 has 8 KB, of both.)

To get some numbers on this...

if you could provide vmlinuz & System.map files for both (otherwise 
identical) 2-byte & 4-byte alignment kernel builds, using kernel config 
here:
https://github.com/hatari/hatari/blob/main/tools/linux/kernel.config

I could measure the perf difference for the whole kernel boot, and if 
there are differences, profile what causes those differences.


	- Eero

PS. I will be using Hatari for that, as it has semi-cycle-accurate 
emulation for 38030, and good profiling facilities: 
https://www.hatari-emu.org/doc/debugger.html#Profiling)


