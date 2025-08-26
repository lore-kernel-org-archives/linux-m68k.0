Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254D02F6564
	for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Aug 2025 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756215186; cv=none; b=sLj8J9rYUdH93Ae+Nmp5ihqErNAR+nwbIxCPVEGsxLZWRDD+CqNW238Wr50YHiXfmw4iHH8FUYPge6iraT+YxjlNB1/9NqBrHBSWG7uJIU6CQZL8wntWDNsq9kLvxFi8uZM9BMChL65QvKD1y48PEj+kfnxqyqHwslm5E5shyKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756215186; c=relaxed/simple;
	bh=oWw9E1ARf/liDxi+bd5estjy09+4qZSi69zGI82k4YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIt4VjnAMrg8KZXA9SmBRNl0PtgzgJtAYCmM8ax/brcpjiq0QlYHX8Y4c1b6FJkX+w9/BSHYGsQ20Uj0q4kMWWTK9Oagmpkn3gWf84kP0SV7RLqvuTDb1sZfZ5j8wJkdkcJoWfTFWH27Z3KW8bLFr8r4hkMFiLCbdcKEF+ttbJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=fcsAPIGV; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="fcsAPIGV"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3ea8b3a64c4so14401655ab.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Aug 2025 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1756215183; x=1756819983; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=fcsAPIGVdJUvBxxhIyCzCwO8p7PD206G+x90znLwTCpuYrxHP0puz+CjgpwIXAs+qb
         DwXLiJV3vmEOV0sSC7pd7jysDUBCGdYAnN73KzTLaQ638kqUHHbYuCEyVTk40yvZ27HD
         rjQ/Q5moIXTEx1BDl/sCJNjxybKSK6VnEwl4iVEjoWdfUW3mzskpwMxX1QVkokQvXtqF
         Qe2bz70RSERHoibPybxZYYOROyJQGFA3vTjwd43kVCRZgg8Co3pmej6MROIRhncqc8wg
         fJCN0hJTrcGuXn8b/mGu5fPQmHRLY92m55LO5hJYCM0qhPWkI836BB4F7Tv32lKWMI+q
         Az3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215183; x=1756819983;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=KAbVRchTw76tzcNW05aj3FyDDp9pOTkrqa873Ype1yEFoRw86A3F8m089qdPiOtXg8
         TqxFfUdtFjGV/vVuiJAbAKGdzMiUR3/DZaNi16wOn+yJCu55ovMHZfCIVd/T990gpcPI
         SuPnSnFdbJodt8TjXDSyi6RB7/Il8Mj0o2Rb4gLB8HtIYa6xYU5vt36fzxLk8+VtOOgr
         Pwka2GSit9MuarP1PC6jj2eU7i7Ttnk6+qZHhg/khicFbpHjtxCaUDjFrcPCfzIqfHHI
         u2qq5DfID0DwdIeNF5BdSmhxaKYWaKsjjeJzPiOZScZLHmp93h5j56lNLS4zZ3epOpS9
         ilIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDy1gjxsqA+PjuymxMIyCAPl5q8skhN8TawCoK7BpNYastHvBm9pcfA8jpc02OWm9NluS60vMLYYeX@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yxck12891iq1T28Cg0aqb2vpSINR0gSOa5kcqmRNFKv/vE0Z0SB
	mAeAqIT1K+l8fTrWYT2YOkC5/nYQG4JkJraP1XjILJ2MOVXDu7DgAKHixJ+8S+ALjA4=
X-Gm-Gg: ASbGncuofq6SgQ6CoYdRu/P5YMVxJOjDbhXiTE3jd8FJ7Q0DuiybXK0EcMWIDZvFMBp
	BfDthHxHEi/IebFZMCaj1L5/tLF3KeY6j/kNzTVp13CSddeN/Ml1hChRNft9lX1MrQtPKnFFGKv
	p3cix0JePumWTSq6OqNHlN8Ck4JlcrNnaof2D0uyivahpoC01nHq+C/P5/MQ+4MweWumQSMIwsg
	seFjnV6P51GnF94LjJpzDHLQqdrAUVA5V2WOJIKmd8wxelhLTu9rxTWtbJfkXxCsqrvetIPdoL4
	uBB+kp9QBYxU/uCFljjhyZLy2QJcYsOsLl60ud9eMbzy01zASEMTvdtqM/huOjnKSNgBk0C5Mrh
	egBCZErUN+MWUgAH16HCj7+lDK7lsfg==
X-Google-Smtp-Source: AGHT+IHyeNqFLofJtawZSGlF7nwnpmwOET4pLDhklPZVdBrPT2USiWbLxPrFpiB4fDQsUH70NQxHfA==
X-Received: by 2002:a92:c244:0:b0:3ee:7c7a:c880 with SMTP id e9e14a558f8ab-3ee7c7acb24mr41586495ab.28.1756215183022;
        Tue, 26 Aug 2025 06:33:03 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886c8fa63casm630889339f.17.2025.08.26.06.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 06:33:02 -0700 (PDT)
Message-ID: <4d8cfe65-a8fd-4f3d-a324-8873f4016ad0@kernel.dk>
Date: Tue, 26 Aug 2025 07:32:59 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Fourier <fourier.thomas@gmail.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
 <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
 <aK22kUhlxlyvVLax@smile.fi.intel.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <aK22kUhlxlyvVLax@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/26/25 7:28 AM, Andy Shevchenko wrote:
> On Mon, Aug 25, 2025 at 02:48:21PM -0600, Jens Axboe wrote:
>> On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
>>> There are a few places in architecture code for the floppy driver
>>> that may be cleaned up. Do it so.
>>>
>>> Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
>>>
>>> Changelog v2:
>>> - combined separate patches sent earlier into a series
>>> - added tags (Helge, Geert)
>>> - fixed typo in the commit message (Geert)
> 
> [...]
> 
>> Applied, thanks!
> 
> Ah, thanks! It's good to know you can take (and actually did that) them.

I've always been happy to apply floppy fixes or cleanups, I just treat
it like any other orhpaned/unmaintained block driver.

-- 
Jens Axboe
