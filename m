Received: from sonic314-21.consmr.mail.ne1.yahoo.com (sonic314-21.consmr.mail.ne1.yahoo.com [66.163.189.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F2813A86C
	for <linux-m68k@vger.kernel.org>; Thu, 14 Nov 2024 18:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.189.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731609450; cv=none; b=md/im2/7CoM26cHi5b3C0ZMIyVmKsPJ0EFz2ZtujkYPswpe8H5edUHKPi3MObHiO3NKIOWOGwKaCluQAOwFQFHouM9T5emA0yfqnCgyvx3JP9/h2d7zMStsswdjrvEI5edxKJk3jUYc5A9ssZAQrXRkZYwzZmMDW7UoeNMpANo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731609450; c=relaxed/simple;
	bh=V+yWHc17UurjU4PdUzNZCIrynnR8/GqiLKxEOGvjK8I=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ZRFgkrz7R5YMBsBzmvFCOIcP3r2th2MF0xgPhXI7YKn3n2M27uxE4kb7T99PEp+XjGat7Mqg52/Uj1/sj4H/eXL4WjIDC/WyST4oh/1xUoeCOkrxV3pHScalhYomMrSfPLuSv8/pZE7A8Lz4Hatx2RHyE0I/tE9xa2fMUZbF+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=WTdfyHoj; arc=none smtp.client-ip=66.163.189.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="WTdfyHoj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1731609447; bh=N93OSqgBBNoIHJQaNuG+denEpJRrloM9zpIEZB0tBVk=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=WTdfyHojiET19dbgruqF+gJUmgm0vtiOcZuSVFWPf61dATqk20nmAnjiq2ZBEiJNYlTTK+Y9ojCuKZ6Wf71F8RyHAA7+Hc7yt5vR6sbPd1w6C0iFbluZ4HkSN+S/ALWAHb+mQJYD4vdS1VYJ7zjOcplzDGGZzhYKlDh1Yw3ROzD3JmXl5lqPVn1nkmAVZq78RWORg0GfWsbHVxB9IxSSpxkQUby5sAfyGOdFaXlgD8IweHL8hI7NBZUhyTs0rjukAZJlECR7MJ61ezaPYBVugPG+RgZY5eq/Sw32s4nAvvWTlLSAPf8viNS+L5cyOepiGFR6Ylm06FPjUKJlPyrdYg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1731609447; bh=9eFypCbYNt5f7tLNbW+kv44S6JCC289meFDVWmXLom3=; h=X-Sonic-MF:Subject:To:From:Date:From:Subject; b=fcu8jBoJtYeo0JI7ATUXBvMB7V/fIKJEBOAFAUOEPO6KiCy3LMUipMAPT7GlpAD7VXGAK7Ga6RBkwef8QduuwT4h1dXjdyrwGI+GEOqQcMPP4kO0ygfyEoajyYZCSU54zr/GxPIQOOLDWxQDLL6RzZ7IcZPO7Tj3Fik4vMwhel4fDP5k/5MKOv6rv9c3fRONiO020gHd9onoXkwBIxydr83NoSDSVfsUdBhKo0kYVhC4gOB+YzbnTRfba1iqAH5yVEKlMRciPFRYNodxYdqY+tHV7gtLtdlzJdJvMsEA8hUu66dJ4tjsIkiEraTLtq8QuCahzr46sKzOmcXmcjvgmA==
X-YMail-OSG: SJ_FNCYVM1n5p90PwFzd0G9u2i.cV_7qZSxm3mGh0.LeQK0gZv2luGTocZs5CWu
 hCK6fT6t4ImMbIDyXOuypRF20jztS8JprLwa4xkGIVPd4sqjsyqDl8K4L6sImszG5kqjwHAmHFBf
 qHoCXvbpsHLW4MWTYwpRcKHGsSPcUSJqn4274Zu6fhI2z.iDl2EF0kOmGle3UzP6tY6MlDkyE.se
 YE9EXVBXrczQmBn4mSS0bH8AqukZtiL0IuIR8k_86JyJpHdyLKYCHjoNrhMxeu7W_MSykK_e.iSb
 Ly6ECYA7YN8xaSMqDeZWjC4_F10m0Qrut1YnSxn7BIRCQV_rNOpJDFoDgGdLLx.76lKd8z3o7rAZ
 Vdu.AsLUHYk9Y8cdyes8NndDwxzflj0aYzQy97vhZ2GSqaKB_w9IwS8K4Cm4_yF7GWOUSnvOFhZv
 dhTfuIQTR3vhmsBxlXfkHH7f1HogOOg9jH7xPnDojjA9OqAB9jI2CpAGS8ooPaA02zjn3wvin7I9
 f1LMamdf_iJQ_8iKv3h5wIne1dQT2a9CfxoRcadbqp5gd07T3x0FH11.QzeZ2TlOeqYZLXYiNvmv
 fmeaFba_8LdEsYV5UDSWS9HRrmhDOovOS4maT2dIljyKzEIxM01xy2EXHHEQ9dFJ_SJZHhLvcZK1
 _MhEI4.5ZYpo8bf4_aitmoUcxHF.CHKp7q3YFS3sXBK1oto4cVbUW_VqlHF1FzL76zfWHmQEWhg5
 w71IBypMPIm21aUlLk4hYG3dVSzw3Kj68fpL1O8roH3GXYzyhH9kA7gQesjEeNxGHr2maTpDv_JZ
 yrKGRWU5d1YBXfPxIAZS8OP6pk7LaNfLWnioFnMginrL30A64sw7JyMfHGa8CyR8H3cPN3xVVccy
 A3otPVkouLH1DGklmFUzHHlf4IWG4kong4wIR3NQGTpOxnE1Ai7ypvFB4o6ZTIKkXJ3l_Hx_iKNX
 .H0mi2_N99Bny5zpX.rmo5WAyBb_YD05iutjvNwQ8jLDN0nrp1Zh7KYln.p7dfUhV4niS7aLa4f5
 EOyIq0diRvRDUglxOHVftt7MmDeSQHQ5rDDjZpzNLvrjkMw7qV7ljtrV25d1n4KyTTNlYuEi6mdD
 Z4RKTjfqCJjqokdEorDfPQkRfnj1UvPNjWDt1XE2kJ59d0I097OugrM9NpoH7pHpEq1T36kg.pVg
 60GaZ9weve8z7Q3eAFgeLDcSguCIQFzc2SQcaZ2z7rnzIbpNd6bizs6GXcnLZyxXcTwOxtq_r3rR
 QiflFacxBE6FzGaFIkd3K4PherHmrAsDr34KF6g8BxwaDkarS8cJqjEJpm9F4zwje8Ix_lf2F5ch
 I3eaqpmKM7yIP4kAN3_ORjyi1I1pNEX.Xz3gDvVaOXKb_I_nYRKNz2SzhuD5hK77NEV.WV4PvuAR
 DpCm1VpdjdBr9zG3SIdXXCxi9XBmpdW6TohsG70byq7eNwSFdS62A8DQfcfXcxM8Mt3wsucB9Al4
 FEdj5v.uOR9IQgB2e6v1Y9Vmef5eldkwrSTWTsKkmLH9G0VAqg5BwpWfA.TkFCvo2D9BXN8N.Lcw
 kvp6PTUKTsbZYT3KdQ3r1MiPapcRPAuAhmlhap1blCZHLBJ8YLoXlEDIsaUQpK2NYWCG.Dgs0GfO
 23M837ZGIMuawRU7suH5M5mltKw6VhuSBeScPj.UdZdn9zqSSedQM_7MdAn2pANmYhxXsj2Xw3EL
 oYc2p2R89zgUKEOAdfgsmcWf.wUIlVPnj7vR.oucKVu11kYNUdZOcdYGKazisaSp2lA8m49CIU5D
 XNi02PcckkWFSxlpSjqdFg9TdZDAeSMMLNjTSGxnXLyeRcXxA.wr9BmDDeeh.qqsexY1VqzFODzH
 XUxokXPKFKtGrZrhI4fqkx5HriQFbsU5u32ZEQD1UvbX7K9S.O03GzhSJKoFcnC4ml2JY7ehvdp7
 UoYOR5JhSQZ0RMkiEAgu1w09zIxR973OMS1TtPrvGwOffSixKZTzJ17qzfkt0Ch0LSXw.twIbTiP
 lmdh7OAVBNHCm8b.hUyVrfl8iut56iyEDWQka_lwHuDCoGilACADidwmR1j8yaONr76EZKzxkw5Q
 ZNHo3Oi8WqvBn07g62F_hrNC2JFTBdmZFQ0amd2iHTSfP09aKdap6RESKtXgzkil5LGbl1m833pq
 LzElRQvMPC7KYHFRZ5_XHNK0h0Ac.dog87_sr6V9_3UW2MaaxxovNoeBIgM78KsWNdHGHPBRbJDe
 D7M5II0IbrV8ffioVWXV6Zb7yo1s6G9Y7dKwwlkpWS3YRn.4up2WQRr1F0UDj0plURuh0rVVh7.F
 lmQ--
X-Sonic-MF: <userm57@yahoo.com>
X-Sonic-ID: 4e8d036b-a97a-4670-bf41-d2272e8c4a44
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Thu, 14 Nov 2024 18:37:27 +0000
Received: by hermes--production-ne1-bfc75c9cd-925t5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f6141acb8c3682ec52fb080f8a7b8dc5;
          Thu, 14 Nov 2024 18:07:02 +0000 (UTC)
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
 <a8611762-5539-d6c7-8d99-2fdaa6a1caef@yahoo.com>
 <f5dd33186498e9ade40b5ffca45d8fabf04a3ec9.camel@physik.fu-berlin.de>
From: Stan Johnson <userm57@yahoo.com>
Message-ID: <6503da97-963e-f0ca-4dea-bfff825b2c53@yahoo.com>
Date: Thu, 14 Nov 2024 11:07:00 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <f5dd33186498e9ade40b5ffca45d8fabf04a3ec9.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.22876 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 11/13/24 2:01 PM, John Paul Adrian Glaubitz wrote:
>>>>>> SysVInit uses a huge set of bash scripts where every action involves
spawning
>>> a new shell while systemd does all of that in C. Compiled C code is definitely
>>> faster on an m68k machine than hundreds of shell scripts.
>>
>> Yes, compiled C code is faster than an equivalent script, but scripts
>> are much easier (for some of us) to edit and turn on and off than
>> systemd components.
> 
> systemctl disable foo.service is too hard?

Yes, it's too hard. And if I want to change something in foo.service
instead of disabling it, I'm sure there's a way to do that in systemd as
well, but using vi (or nano) to edit the equivalent sysvinit script is
easier for some of us. Also, if fubar.service is completely messed up,
then I might not be able to boot into the operating system that is
running systemd in order to use systemctl (especially on a slow system).
But if I'm using sysvinit scripts, I can boot a rescue CD, or Gentoo, or
whatever else I might have installed, mount the relevant root
filesystem, then disable the sysvinit script (delete it or change the
leading "S" to "s") or use a text editor to fix it.

> 
>> Plus systemd has lots of components and does lots of things that arguably
>> an init system shouldn't even be doing, things that aren't needed at all
>> on old systems, such as managing logins, setting the time and managing DNS.
> 
> Old systems don't need user management or networking?

Yes, of course they do, but some users don't expect or want their init
system to perform those functions.

> 
> FWIW, these components can be turned off if you insist using a separate package
> for each and every standard service that's part of the standard Linux userland.
> 
> You are not forced to use systemd components.
> 
>> Systemd even complains if I manually edit /etc/fstab.
> 
> Which is a good thing. SysVInit systems would just silently fail when you added
> an entry to /etc/fstab which didn't work properly so that you could end up with
> something not being mounted where it should be or vice versa.

I'd probably see an error message in the log files or at boot time if I
added an incorrect entry to /etc/fstab. Some users don't want their init
system to be a nanny, especially on a slow system.

> 
> Ignoring such failures provokes data loss. That's *not* a good thing.

True enough. No one is suggesting ignoring misconfigurations; I'm just
suggesting that systemd isn't the right place to provide nanny services.

> 
>> Perhaps there are ways to tune systemd for small systems,
>> but I haven't seen any distribution that does that. On small, static
>> systems that don't have USB, Firewire, PC-Cards, etc., udevd and
>> sometimes dbus aren't even needed, and systemd is certainly overkill for
>> such systems.
> 
> I'm using systemd on my Amiga and any other embedded system I have and it works.
> 
>> I'm not trying to rehash old systemd/sysvinit discussions; I realize
>> that Debian has chosen systemd as its default init system. That's fine;
>> Debian can do whatever they want, but no one can tell me that systemd,
>> at least in the configuration as it is distributed by Debian, is better
>> than sysvinit for small, mostly static systems. That's why there are
>> entire distributions that are dedicated specifically to not forcing
>> their users to use systemd.
> 
> You mean "professional" distributions like Devuan?

Devuan is great, even if it's not as "professional" as Debian. If I
required a professional distribution, then I would pay for professional
support. As it is, Debian is probably converting more users to Devuan
than anyone else. I had to install Devuan on several Apple x86_64
systems because Debian keeps breaking X11 support by making systemd a
dependency (even if it's a temporary mistake, and I know you aren't
involved with x86_64). This is a hobby for many of us, and we don't need
the drama. Besides Devuan, Gentoo is also very good. So is Void, though
they recently removed support for everything except i386 and x86_64. And
of course there's always NetBSD, though it has some issues booting on
powerpc.
