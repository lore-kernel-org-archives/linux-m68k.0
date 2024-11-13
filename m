Received: from sonic303-22.consmr.mail.ne1.yahoo.com (sonic303-22.consmr.mail.ne1.yahoo.com [66.163.188.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D94718B467
	for <linux-m68k@vger.kernel.org>; Wed, 13 Nov 2024 21:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.188.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731533967; cv=none; b=cOQI9+e3AcXyGCficwKLdw8OrNEQtoFghbc3AAF2k8/x81G9iR5e0g0FNcDZw3air9McN9HZmUpjHPeXlso9QzaK+ruRHfl+RyylXtMpOdUBeqON6+KVWoCpsuuJuw1yNigso57YiW5sO2bCoHZrLwPIPehXU3m6tFgAYGHAPUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731533967; c=relaxed/simple;
	bh=r69Xf7gCyiVDEPR59ReK9I/xWM+JcqhglD6Mk1D2UnQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JQWBFfPJOd6LO9DdtEY7zhobNOulv6MGxChPWqDOu01WQvOVr1ObWCvIm1qJD/gsV3nbBXzXGK6+UWlqpGaS2cpMM7NVypdyXdqUeMn4h6qLbMbhxgMWddaR3MwAo854vnbsD48G+xUxILyoEXJQHLLfDQ/+0sZ9sczstIR4Uz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=slqeKhMD; arc=none smtp.client-ip=66.163.188.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="slqeKhMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1731533964; bh=oeYVSZ33VdzEiqQidwr1Ez6Ai4dC3vb6Ww90zBru1+c=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=slqeKhMDGWqO3XF/HV7z72wkC0IDWg9KURLN4rmIGGUjm8jgrXkjuLxiVLGTR6GmmH+4TO7bvzalvkV1U4xwNra8y/85N2lVzJ2ComaH156Y7Sqbc9uSV9CmEueC51V9kdfIELJUJbG1Rgygv1TvZvaPew4pOoX1nqtIp9XrlgtI4yBcJtZBN6DYMiI4nXM64xwMc4MMgfJIv3pLNrjJKHJXGRHHnXlNWGW6/RLKhXZYSKpylRj3ra3hZBvHb/Eu650vYvilslKjgkV629bNzsW7eXTjH2yIWbtaf0LjjTHfrPhUIwf8w2O/HHpQkbtyKMY8aTHL2yNlyjavNRbxaw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1731533964; bh=n1TrMdwo3Vdp1gA49yf1J1+xZuzkgVllcK4lbPpXwv9=; h=X-Sonic-MF:Subject:To:From:Date:From:Subject; b=YDCcL/Pn1ihLgL7kUagtn91R1CZY+T/uvtOzUjT0rgUsn+6LlwM5McHD9MlkyAa8eM0yWsXqa/iNpm9GYKmzykdcCjTlIgsfE9nYVYvzjjKo0ckvsEDTQB4BcM9nd067BgOGdqW2gaM55rQFhSJKb3berSo9xpuERjcniMNa08r9Emp7nlKgUAcjPEEEHr3/Ehqc/JWMsFl/sLLgFNajd+w/eo7yJAI4zVIeoBWKMvvgBwN9/XhnJkZP8pIXtryqU39+jzJEcdbzGftbnB/EefONTo3u6DnQka1PaNuO7X+HC1BKfh0mhqK25hBof+YzkH9bkKABWgMUTWFmtqMFiA==
X-YMail-OSG: S7v8Zm8VM1mXUKuzPNdN4aEmtU_4jxz0lgy.36f2VVB.UbPiluo3YMYYwJUiuRw
 wyEyo74M5X_3T9.7CClQoaNUKS1z0bWy7OccfpkmAe9UK2fCSKdST8f9m73fcDMWZnZnsU09nuau
 yIcAKveJzTOZtB_3G1Ns0i1n8tNDeuyxoL0slurfmSaf2kCXmGteh93wnH4BAYIyD48SKMh7Ogwq
 qZqk66zjbpgM6y21SaFotDlOlJYgHUeGpsPHrDxNne1M1._vhQdQeKGx1R4SOnXNmJH9xnumDQiX
 Q79du22t0kFV9ED4RAJM3sXRtZuVgLma7mRkqewseHGeRJJKKSBubxstdvQnQ_g07vQxqLCCIck.
 czYKe2aR.d7LAmncXxPuk9JfxGz_6u4MX9FPWcwBuP8cbRK4iydelVATJ3Y8qpx8LAxe_aK.o_hz
 QteQfoUUQ58tjgLSDTsLNZ7rWfpFx8GxVQ6oNXkXlvHrpL3Zg0WnkePrXR6QXHl4l6UE4CoP7zF0
 RpFLGng.FBgslRF3D6KvUJBEReVuTIBFdmVSgkIDmRNM0uqKQLN0nBWb7IstAxjaW_2TpEjjYKdJ
 xpD9eRNz6a8nWJTF_FL2AsiPzIVqwH5JHIMb.Ago3TQ75.QDfA_Z9vt9KSGuVPwzL4RSVbKm_oq0
 1WdwxZfOYoJwYcIobTzqKk2JNU5w2NwUWl9pdbYz7c7DvrGZTC2kkuqztbK5TgJN0nZX4wLfoaQg
 i0WabK31pfQePieTpMRo10leOYo3aHvW_o6d7aZsiyiDVbo_2S3k8a9N72OhtPTUJdsTKoE_xZyE
 V_Aqs9qM4QaYQYtmBrK8RPpaSAdatgJQluJBcOuXzhpmpUYJAaSg9EIUtBB1QhhFn4hiM1Li3GnS
 8O44qpHjz39D_.Q43mqIOtboguHS8bFsOJQaEeJOAqee8PDgKHTHqqhvdCJtSlRzCv2LKKqBDGTK
 iJXpEiB5IO0mEiUatoisxVL0j3OHWbN2P0PfZlUsCT6AcHcQJRE2gHUjVxLNSeofceAz9QRfb2EC
 b8gl35NFOybSA.UkKTODRVOMfZcx9mLkZ3BO_CtwFTHY1.pSMHf2OktBSedCZ9b4w4kFR5gEASAc
 mzXXdsdzHZBPNMN3B8l911Ytol8Yv.ruw.ZUw_lN6qJKtmkbLCE_AUnb5XhZCFXFH8V1NeUuJceg
 .0.befI56mWA4OHdp4djDbdIyJTiQ5cuO4Za2Gkmq8l1boayLr9OhJxJFBPBNPRrBqMqgRx8iuzU
 jqk3tKUlOMr7nGjIcUbQneiNgGkO5znak4RsnP7pHwbHRaRF7ZLBZfzc4yasErxU3Qj19ho53OMx
 mMWIq6iNIWvHNJkeS1hevDTg_tSQ6sz4vHleAP1zpGQVeH1AgCnI_5SSK5WZjY.pRQW_sTRtOeqI
 5xwJzJNs8cXwqCnNOBaOmuj7LyT6xwMXsgbPZMe4UvKlCfMTFu46ORmErdNzZFRcy6kgJX1XQo_E
 mERXC72QXulOuQBHmOq1viL0ewiK9A8SxLsYU1GTyJuHoTQ4V4aygMMTJVakj0kK1olTG8gdG9CN
 t8DmzkI3rEIsC56fHTDAUWRnIQ6b2tlNYqeGVDTIjlaeR9RXLJ11oGJgVjDteKZm9SGA.AI1SiUB
 _RSez3v3EWn08tYRovJ81wsFSJNoCOhtxryP2X32QtDigSQjxZzUzJIRgoZDAZHsw.05WqKQSsQP
 imfp5N1PIf5ENLUjssZ_vsDityg0ws_gwPnj9m6Ah14gEUzGkMsP7CaVpxu9TuiKgM58tej8A42a
 ibH5tYjKrkfKxRebZxSIiCEFqIvqnVOX3SH52WPzxR9ZVHLyrdjLCvW8rj3zp3s0LK0cQP0GHTM0
 KQ464uRCRbuaGUIy_bIr3uKeV5wGlVpa2jLxPesmMCMP.wUL_T7xvc09t22NabDkPa9PUXMyQBRc
 HcWSlKzD8mIY10ya22FyY3wE7myzkHpTrA01kqYSWCIt0wI_lnarOOjeFzXydY_xYPKRjVD5pFGp
 8Dk2Jp7S_z.HZcDxVJTXCxYdJIpEDOdc7rp_LMumK.xgtuqr7XbDvrEJNjEcCI0TdfB05xrIeh4S
 yWOGaUk8eCVD1OdmaOpq5tnAAcXm9_XK95ZHDueXCUbek7kdMcMqO2qWgvRC1Sfv5yBelkEtXfif
 LwtugibWEnWW88pKxnF6961WAeNMUMUBFPhL.lOf3N59oxNQozG6IVISi0KeQrhLtZtm2OmglHMS
 9c5ga646mmU4HRDduR2vYjYZCyZ_6ryhH9rSgdvLohUhHcFubbrRnelRLIMzpyyrlb5E1wFl5m7Y
 i
X-Sonic-MF: <userm57@yahoo.com>
X-Sonic-ID: b0bc4eaa-dccc-4f5b-bfea-c4c2e6d98dc3
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ne1.yahoo.com with HTTP; Wed, 13 Nov 2024 21:39:24 +0000
Received: by hermes--production-ne1-bfc75c9cd-5vhvt (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 7c416552bdf34ede352fbcd74db35eb0;
          Wed, 13 Nov 2024 20:48:44 +0000 (UTC)
Subject: Re: Plan needed for switching m68k to 32-bit alignment
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-m68k <linux-m68k@vger.kernel.org>,
 debian-68k <debian-68k@lists.debian.org>,
 James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>,
 Finn Thain <fthain@linux-m68k.org>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
 <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
 <8ca13b4b1a3c2d8d2e6d99c29b901659bb4108e1.camel@physik.fu-berlin.de>
 <f87a85b2-809a-44dc-9a61-24698d7888eb@gmail.com>
 <31a04ef1ca569580d29ed09097766e385a23044b.camel@physik.fu-berlin.de>
From: Stan Johnson <userm57@yahoo.com>
Message-ID: <a8611762-5539-d6c7-8d99-2fdaa6a1caef@yahoo.com>
Date: Wed, 13 Nov 2024 13:48:43 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <31a04ef1ca569580d29ed09097766e385a23044b.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.22876 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 11/13/24 12:55 PM, John Paul Adrian Glaubitz wrote:
> On Thu, 2024-11-14 at 07:36 +1300, Michael Schmitz wrote:
>> I didn't say that - just supporting Arnd's point that much of the RAM 
>> constrained old m68k software won't benefit from today's user space.
> 
> We're talking about an open source stack here. No one is going to run an
> old binary from the 80s on a current system. And if you want to run old
> software, you're certainly also not running the latest kernel.
> 
>> Development isn't driven by memory pressure anymore, so code bloat is a 
>> natural consequence.
> 
> But we're not really suffering from bloat. On the contrary, both software
> like systemd or Rust-compiled software actually use less memory, not more.


Well, systemd is completely useless on every 68030 and 68040 Mac that I
own, even ones that have enough memory to run it (e.g. SE/30, IIfx and
Centris 650). It takes most of its time just telling me about all of the
things that are timing out. It fires off too many concurrrent processes
that overwhelm slow CPUs. Whenever systemd becomes a hard requirement in
Debian, I won't be using Debian at all (there are still GNU/Linux
distributions such as Gentoo that do not require systemd).


> 
> SysVInit uses a huge set of bash scripts where every action involves spawning
> a new shell while systemd does all of that in C. Compiled C code is definitely
> faster on an m68k machine than hundreds of shell scripts.


Yes, compiled C code is faster than an equivalent script, but scripts
are much easier (for some of us) to edit and turn on and off than
systemd components. Plus systemd has lots of components and does lots of
things that arguably an init system shouldn't even be doing, things that
aren't needed at all on old systems, such as managing logins, setting
the time and managing DNS. Systemd even complains if I manually edit
/etc/fstab. Perhaps there are ways to tune systemd for small systems,
but I haven't seen any distribution that does that. On small, static
systems that don't have USB, Firewire, PC-Cards, etc., udevd and
sometimes dbus aren't even needed, and systemd is certainly overkill for
such systems.

I'm not trying to rehash old systemd/sysvinit discussions; I realize
that Debian has chosen systemd as its default init system. That's fine;
Debian can do whatever they want, but no one can tell me that systemd,
at least in the configuration as it is distributed by Debian, is better
than sysvinit for small, mostly static systems. That's why there are
entire distributions that are dedicated specifically to not forcing
their users to use systemd.


> 
>> What such hardware would benefit from is low memory optimized user 
>> space. That's hard to do with Debian, as bloat appears to have crept 
>> into the build dependencies chain (if I understand you correctly).
> 
> The build dependencies don't end up on the installed system. For example, if
> Java code is used to generate documentation, the Java runtime won't have to
> be installed on the target machine. But you still need a working OpenJDK
> to be able to build such packages.
> 
>> While Debian was the first Linux distribution to support m68k, these days 
>> there are other options, maybe some better suited to low memory systems 
>> (and I'd consider even 256 MB on Amiga 'low memory' ...).


Well, I'd consider 16 MiB to be "low memory" for 68030 Macs, but you are
the Debian m68k port maintainer so you can consider whatever you want to
be low memory. Hopefully the bloat (Linux kernel and applications) will
be minimized so that old Macs, such as 68030 PowerBooks and desktops
that can have no more than 36 MiB, will be able to continue running, not
just Amigas that have 256 MiB memory. If we're headed toward Linux
distributions that can only run well enough in QEMU or Aranym, what's
the point in having old systems at all?


> 
> Again, the problem is not Debian-specific. Heck, it's not even Linux-specific.
> 
>>>> Much as I appreciate Adrian's efforts to keep up with user space
>>>> development, I won't be in a position to help with an ABI change.
>>> Thanks, I will then just do it myself with brute force or drop the port.
>>
>> Sure, you do pretty much all the work on Debian/68k, so you get to decide.
>>
>> If this involves changes at kernel level (syscall parameter alignment?) 
>> however, my recommendation would be to rather drop the port than end up 
>> with new kernels no longer backwards compatible with old user space.
>>
>> Otherwise, I'd not even be in a position to do any kernel testing and 
>> bugfixing (which often requires hardware, not emulators).
> 
> I don't buy this argument. Why would your world fall apart if we switch
> alignment to 4 bytes. I seriously don't get it.
> 
> Adrian
> 
