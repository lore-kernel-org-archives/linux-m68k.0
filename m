Received: from smtp.dnamail.fi (sender103.dnamail.fi [83.102.40.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EF3433A8
	for <linux-m68k@vger.kernel.org>; Thu, 12 Jun 2025 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.102.40.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740074; cv=none; b=jUNHCDyuE9r5vjQWLn/doRbVzSRqfuxjFROB2PR1yFOsk0ru1pXjdnSqyCSW1bMON4FfwMB0YzzCuxOBxwX4pQcXhClrhwtAJGPENlfDOYeooWSUDF9yPdHf3t5k9yXBbUuGIh4YeYEtH7Zq7jdQk7KWc2bo+wzrDYMm5JEcn7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740074; c=relaxed/simple;
	bh=pj6Ie2XPdLfJ01/A0aQXJT2xpYqn5t+xIUrk6JlZtA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0ZGV4YcdD9E0FdQp6uG6hd9U+wIvfNDTY6r3yunU6PUV/t2z2dFCdphT95g68ChwUChId2mTzs7zmLho/cMV4ZOyjXTLPu6XxZrlmQxjQbSRxcKxBOmlwSq+AOMVEjj/81cpv7gfBBZs/CaEZ7GhZueMoOHkeYdzct2Bw+7O8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi; spf=pass smtp.mailfrom=helsinkinet.fi; dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b=Ll+ntkeS; arc=none smtp.client-ip=83.102.40.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=helsinkinet.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helsinkinet.fi header.i=@helsinkinet.fi header.b="Ll+ntkeS"
Received: from localhost (localhost [127.0.0.1])
	by smtp.dnamail.fi (Postfix) with ESMTP id 2FCF9400E1ED;
	Thu, 12 Jun 2025 17:54:27 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.157])
 by localhost (dmail-psmtp02.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 5qF_XFNQZ5ea; Thu, 12 Jun 2025 17:54:25 +0300 (EEST)
Received: from [192.168.101.100] (87-92-13-246.bb.dnainternet.fi [87.92.13.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: oak@dnamail.internal)
	by smtp.dnamail.fi (Postfix) with ESMTPSA id 66092400E143;
	Thu, 12 Jun 2025 17:54:24 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi 66092400E143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
	s=2025-03; t=1749740065;
	bh=Niy0UNsA2QwCKMZAvfiAjykl1Cip4SkC5NRjpxTCTUo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ll+ntkeSKagA5UPrOf4x7Qrb+rjgAEx0eeOVfmzfnf22+w2cI+cvuA8CEjeVtI1U/
	 aWnlcuR5itKT2TpDqlMLbN1toa0kd/HwG5JFGfT4RPu69kZhAwWHrUIDcF1DwqnpyT
	 05DECzm5HNIDTLME5x5uotxDZbnyn8tcCyb8swJjTG+q44jAbk8kTQAbQmEKGGhzTm
	 eQ8GxQe9WH/pG5E0apEHGcBtl5a4IOhyH8vBUchzYgoxKc8cKj1NTP1qzAjYPNvqvb
	 wk4Jow09jTbCFdJ4kDfTEiaGszAH6avoXug8AJ47RCO495jtOS1sbv1IK+f+95G8Bk
	 jc/DoU9yQ5Gng==
Message-ID: <243529d0-daac-48b9-b482-04e3ed2f66f0@helsinkinet.fi>
Date: Thu, 12 Jun 2025 17:54:23 +0300
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
 <6a50c81a-cb0c-4529-959a-fad5260261fc@helsinkinet.fi>
 <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <ea1aecf0f20b5466f63b3c6e671d1d29c81dfd87.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11.6.2025 18.49, John Paul Adrian Glaubitz wrote:
> On Wed, 2025-06-11 at 18:32 +0300, Eero Tamminen wrote:
>> It will decrease performance if increased alignment means that something
>> that fit earlier into i/d-cache, does not fit any more.
> 
> »Control whether GCC aligns int, long, long long, float, double, and long double
>   variables on a 32-bit boundary (-malign-int) or a 16-bit boundary (-mno-align-int).
>   Aligning variables on 32-bit boundaries produces code that runs somewhat faster on
>   processors with 32-bit busses at the expense of more memory.«

The "more memory" part is the gotcha I was referring to.


>> To get some numbers on this...
>>
>> if you could provide vmlinuz & System.map files for both (otherwise
>> identical) 2-byte & 4-byte alignment kernel builds, using kernel config
>> here:
>> https://github.com/hatari/hatari/blob/main/tools/linux/kernel.config
>>
>> I could measure the perf difference for the whole kernel boot, and if
>> there are differences, profile what causes those differences.
> 
> But anyway, as I have said before, I am not going to change my mind on this
> and I'm already working on it. If you prefer maintaining a Linux port with
> 2 bytes alignment, you are free to do so. But please don't expect me to waste
> my time on it.

Unsubstantiated performance claims are no good.  I was offering help in 
substantiating them.


If perf improves, that's validation for the performance argument. If 
performance impact is insignificant, that's proof against claims of 
4-byte alignment decreasing performance.

(Linux kernel has general "no ABI changes, as long as ABI has users" 
policy, so verified arguments like above might help sway kernel 
maintainers to help with potential 4-byte alignment issues.)


Now, if perf actually decreases with 4-byte alignment setups, it's 
something to investigate, and hopefully / eventually to fix. Pinpointing 
causes for such things is something where I can specifically help.


Note: the above kernel config is a minimal, monolithic[1] one.  It's a 
starting point, much faster to build & boot, and makes it easier to 
pinpoint issues.

After that is done, I could measure + profile also something closer to 
latest Debian kernel config, if additional data points are needed, or 
you're just interested about alignment impact for (boot time) perf in 
specific additional drivers.

(Full m68k Debian is too heavy to boot in reasonable time on machines 
that Hatari emulates, due to missing crypto acceleration, but IMHO also 
unnecessary for kernel ABI change discussions.)


	- Eero

[1] This is due to limitations in the current Hatari profiler, it was 
intended for profiling ROM code and (CPU+DSP) programs on OSes which do 
not support shared libs / modules.

(It's been used e.g. to optimize upstream ScummVM, so that subset of its 
game engines work OK even on 32Mhz 030: 
https://scummvm.org/downloads/#release)
