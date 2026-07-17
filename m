Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5342A16D
	for <linux-m68k@vger.kernel.org>; Fri, 17 Jul 2026 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299264; cv=none; b=TljVamZV2vM9NZI0qPZxV8nl9tx55KB/ipch2D2Eq00AfmMBMJPwOzbEo6FS+ZOKlxmPKc2erU+cLUlcHS5BapiL2Hc1BNtVa2cld2CrTjq2hFZlr0wiU5sqMayV66BlO45clXIyDEOBZtezfR5/7FIQHkrjziylD5NbsAhFT1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299264; c=relaxed/simple;
	bh=F7s9dembt232wyA6qosUjhk+FCkJVNNHn8hRuzhocmc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dex5szymYpyAR/IjIh9HahP3TVVwq5c7KnT57vX3HXk16qz+LCgJvKIB1lKf9IjHL2rGRY8sEokg1pi6wHaXQ6gSDfR/a+ufm2DPC1vhMyZj93bgnPAMOnq4zfiYlAXcPVbtJ6j0qg24qYkATodzlsbzbZjYhoiBFZDgT2bW7e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHz+SApU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHz+SApU"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-475881b9a4bso4582431f8f.3
        for <linux-m68k@vger.kernel.org>; Fri, 17 Jul 2026 07:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784299260; x=1784904060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1nk4+4+5DNtzNLLSUTQbPuIxmx84FZcEmFMQq7uDeU=;
        b=QHz+SApU7NrI2qVaZ6e30e0kx96FI4VG4OvHQlpwmpqVJ18DQGLPNDf9nTWbRu87PX
         8yjPoFy/EeqG2vLjff2hB2oCkg5w3QOtSoOEr7U7MIfYDq6ZvWaiJjb/Y0vsYykU5Rj0
         Ji3OgETdHyx8vC8c4ihtI2uB35bj29rPu4ejp/Ks4b8x6LD51YOH8Nvq8fBgIvdxJ9WR
         DqmXKxdubvWoR0DPk84IDCsFIuqLBcCiC2flnywyP2n6FLUXf/G0m+OjhegfPojGb3aK
         Mm9NHB+6m3rpE/5CQbh/9UN/cNhWbFWgJ2KAJZ+NZ0Nom0IoFzyXAhwLXbbx2JdMlhnn
         QtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299260; x=1784904060;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1nk4+4+5DNtzNLLSUTQbPuIxmx84FZcEmFMQq7uDeU=;
        b=qbuTUEaCYDZP3HN4wMTeIergr/mx/i+0QsMHrzjGfUcppxyLVdsjetn85wzT7qzDlx
         rXjLjflom8dNGWUwqSsxu/SkjTO5/DnqsUqaT+mrSwFHsDfoWR6LgP6tevd5cBfsmFw0
         QQ11qToHfQrGOkBklVE/wHH1Hz1CsLdrUI1mYZ6KIjwNu85QN1ExTX/zHd5EhJ4u/8lA
         n3HlGLKZsGVGyHQbfxSbZzFH39XaIGsEhaE+f64IqOirmRIt5S+8lIxSIQkbsT+cgr/+
         +LsWsWDSK3BsdF90BnJIN/C9oL3r0Q/YmnPuKA/f7ByOjRaz0jcGJnpY8va09dmM8Jrw
         rpHA==
X-Forwarded-Encrypted: i=1; AHgh+RrQirg3Mwyups784Ub3/9F85zznUw4YhfThnCklrmYtdin8SCCkAzLh8Z6loP3lU6B5srLNtk8gdvp8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6AMf3d+GGlG6OKX817WwXcrJYbquoLQ/x+sJ4mrIp+s95db0
	Wy1FdYMFmaTbp07LHwMtQpROzmz0D3y4cd4mhD4VtyUkYheXgypBVxV+
X-Gm-Gg: AfdE7ckbXnRliogaLQOlZy4ntiOF2kwjS4gPPW0swvwH7vGsumAXwdvoUBS2CxD8m04
	0fa9TKC9gOCfoXq+9kKhIFLude1+fniHpHqss5VcdIWk4mLOXQGNUCSV6U/MncpEX9vh/XNGyHE
	g/0qfUE6y8/ToA2ic2tNoU1dcBf7e9C/yFdB9eSfQi4ltYHHgR468oth1qj08/A1jro4HkoHPLO
	FMLMUA6r/Lbb/FuO8ufY7d4MCyHyrx/sgVlLHrIbFHEiY0eWUqTqUkj4DdMw98eq+rJWgLrx8ue
	cblArKPX2zc7Nvl6qYNt6iygkvsTbwhpB59cNmGbo6bmddTPPR8XX5rJ4UMP1S/2R+gJfrIV5ld
	s4nrSaZtdDy2onuwKlVh5PSals90y92KsfbVO2cSYWy2duUdDdNgztdFujIjEKxgUD/BNWoql01
	CKj9772VtRMCQtYUI44M8WWgVcJ34boimaw/JUsdzBWOfg4bTePd8IG8kqDER3NZegUnBvrCj70
	wr6
X-Received: by 2002:a5d:5e09:0:b0:475:613c:c9f2 with SMTP id ffacd0b85a97d-47f622f2144mr3864618f8f.5.1784299260438;
        Fri, 17 Jul 2026 07:41:00 -0700 (PDT)
Received: from ?IPV6:2a01:41e3:28c1:8f00:c806:eadb:144a:a3c7? ([2a01:41e3:28c1:8f00:c806:eadb:144a:a3c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ce4sm4501072f8f.8.2026.07.17.07.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 07:41:00 -0700 (PDT)
Message-ID: <bf394ef0-c22c-44f7-aa05-de6fe665767c@gmail.com>
Date: Sat, 18 Jul 2026 02:40:59 +1200
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 14/14] m68k/atari: USB - Add ISP1160 USB host controller
 support
To: =?UTF-8?B?TWlybyBLcm9ww6HEjWVr?= <miro.kropacek@gmail.com>
Cc: geert@linux-m68k.org, linux-m68k@vger.kernel.org,
 debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>
References: <1364174192-25406-1-git-send-email-schmitz@debian.org>
 <1364174192-25406-15-git-send-email-schmitz@debian.org>
 <CAN5rfbQMfUDDu6jUJaR=u0o-_SeVGA+6FQ-SwBShtq3rN3APCQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAN5rfbQMfUDDu6jUJaR=u0o-_SeVGA+6FQ-SwBShtq3rN3APCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Miro,

[resent as plain text, sorry]

On 18/07/2026 1:49 AM, Miro Kropáček wrote:
> Hi Michael,
>
> On Mon, 25 Mar 2013 at 11:36, Michael Schmitz <schmitzmic@gmail.com> 
> wrote:
>
>     Add Atari specific support code for isp116x-hcd driver used by
>     EtherNAT
>     and NetUSBee adapters. Both use a 16-bit data bus wiring that is
>     byte-swapped
>     in hardware. The EtherNAT adapter also has quirks relating to
>     interrupts
>     and needs interrupts disabled until after the chip has been reset.
>
>     Debugging of FIFO register access code and NetUSBee support by
>     David Galvez
>     <dgalvez75@gmail.com> (MiNT driver author).
>
>     Signed-off-by: Michael Schmitz <schmitz@debian.org>
>
> Sorry to necro-bump this email thread but this specific commit is 
> quite interesting. As far as I understand it, this patch was proposed 
> and merged on top of Geert's m68k-queue branch. However five hours 
> later there was another set of patches meant for upstream/debian 
> merge: 
> https://lore.kernel.org/linux-m68k/1364193464-3890-1-git-send-email-schmitz@debian.org 
> (interestingly, it wasn't CC'ed to debian-m68k) where you explicitly 
> asked (https://lore.kernel.org/linux-m68k/5152996E.50800@gmail.com) to 
> skip 
> https://lore.kernel.org/linux-m68k/1364193464-3890-3-git-send-email-schmitz@debian.org 
> and 
> https://lore.kernel.org/linux-m68k/1364193464-3890-12-git-send-email-schmitz@debian.org 
> (this one) patches.
>
> "I don't mind for it to live in m68k-queue for a while" ... so, 13 
> years later ;), what prevents merging NetUSBee support upstream?

The register access logic was far too hacky for my taste (and I'm sure, 
Geert's). Unless a way can be found to handle the endianness issues and 
required byte swapping transparently, this patch just isn't up to the 
expected standards.

I never tried to submit these patches to linux-usb but I had 
interactions with the netdev and scsi maintainers, and despite my best 
efforts, some patches that were a lot cleaner than this one never got 
accepted.

These days, my EtherNAT board is broken (PHY dead as far as I can tell, 
never generates an interrupt when probing for carrier), and the CT60 
boots up with  broken video mode, so I even if I could improve on this 
patch, I can't test the USB code anymore. Haven't had much time for 
kernel hacking either recently.

Anyone with access to the hardware and an inclination to get their hands 
dirty is welcome to take over these patches and have a little fun with 
the code review!

Cheers,

     Michael


>
> -- 
> http://mikro.atari.org
