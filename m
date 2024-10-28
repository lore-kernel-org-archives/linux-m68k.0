Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D385F1DF98C
	for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 18:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730141845; cv=none; b=T6jhoJ4psl6hC5x0/5Lskc4KSGCyLSAPGBzQ3Djv3VmT0GOQAfcwnha+2q3hf0b1+FZpqQlxKWphlR2XdQfjk0Jc6Yrm4pwRhBalwD/cNNZte2ytbpnr4/lzio+YHAwNvCf2+WHJ43SAJ5ZOvpcH0UZ3loAJxdfeCjoqIYXZJWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730141845; c=relaxed/simple;
	bh=9kud/cIqROlJ+YOmUzponeYRgjsw4Osn09jyOTNtm+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFxYe6mFzrSMGmkH6gSuHdodLEx7spia3bLm/YswPOqyhNt23MKT0yh2+9OWbU8yQkaKEoB65XFef+tWctdu/Fr8M3dzqwKxcpLzj0a2d1I5L7tYLV9ILScK9z0NIKH1tJ4RHNOEvRt4V988dN2bgc5Xig/9PgTySy2L92p6LIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NuiguP6g; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NuiguP6g"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20c8b557f91so42452335ad.2
        for <linux-m68k@vger.kernel.org>; Mon, 28 Oct 2024 11:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730141843; x=1730746643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/FX7TFPlmjszcZ1f7q8sFzCWWJKQyxbknuTNOzMAih0=;
        b=NuiguP6g5Og8/JCPxMp3FDI5JELNafZSvZqZrUuSr1rfvOE2dQT2nPct4YlZRBpFB7
         xzmUc42kxXL4IlWHdRWJT13CuCJhStjwD2bhgiZgQpwQpzWtf6JM71+DiXUMSamlwj/7
         YqOsxNOi4ylmzmCObUioM0WrDPbaOFyQLaF/uzMhmevv/HIUKxJnKluaACn4t96DP0Lf
         ellNIkWr4ITBIMIZRqqZuhMyUC/tg63W3SHUtErmvH5/bbg/1ZaJfLAJhxXq8Clj/Mnf
         9l+fwI71MnTwbb2du5Kawa9YyW1yx0UMzqlMePpr5E6cpu60ceTUK2MCRyMHIypsfoI6
         goYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730141843; x=1730746643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/FX7TFPlmjszcZ1f7q8sFzCWWJKQyxbknuTNOzMAih0=;
        b=QOcyZ6qHioGvzw+I7oLTHR7dyzKFhw7AFshfEhRbgjYp8IZ/W/2iMrg6Qfxf5/YAOW
         KFFWUcQVIbLFZglUOANGzO+f34xWIuiTWVEKLpMliTd4dKOPyBGxLBxGT9IkOH6p6bFw
         OWpYRcRhh0kW7HWjXxPirlryOqyWDx9YWjYJdgPak1gs12VeLwRGDo11aJwE7fEyRCQ6
         nCDRgo+ZRrgGAOFSr3BYA4igu+eE1hXa51jrnlSQN9RoXyWcQSbhkOhwo9MRCHJCJN1j
         I3clnQ9DjcJ9eddPuBPdAFAz4t8QSI3M7OWxOKnk8w4Km/+4Bzs/Qgcfa4r9fBDY5qzA
         TF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvdbIQShIpq3MjBF3lKr78TeWFPbLG4gTPpZs3do5cgKh1UZ10v9+4++aXeSEUOgVdrLHt+vNz5ap0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq2duOdYBTziWZmOE670FQe5+oET4csc2meASZEChGYdMN7KeW
	SxTCmWhBD1h2HHKe58JWqqHxPjEBCyicYvDCcT7gsq3ZXspDuaXNB0lGEA==
X-Google-Smtp-Source: AGHT+IHntH1iKGu0H4Z41+aBEM3B3PUjuTeVde8qVoBVW1ortEMNM870dBLDqj6LD7bMstoDkA4AAg==
X-Received: by 2002:a17:902:d501:b0:20c:a7d8:e428 with SMTP id d9443c01a7336-210c68aa356mr134127135ad.7.1730141843114;
        Mon, 28 Oct 2024 11:57:23 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:a422:b23c:53c7:43fb? ([2001:df0:0:200c:a422:b23c:53c7:43fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc012fb6sm53960185ad.138.2024.10.28.11.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 11:57:22 -0700 (PDT)
Message-ID: <832d65f2-1796-4ac1-b49b-380bf64700f4@gmail.com>
Date: Tue, 29 Oct 2024 07:57:43 +1300
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Plan needed for switching m68k to 32-bit alignment
To: Arnd Bergmann <arnd@arndb.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-m68k <linux-m68k@vger.kernel.org>
Cc: debian-68k <debian-68k@lists.debian.org>,
 James Le Cuirot <chewi@aura-online.co.uk>, Sam James <sam@gentoo.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@mirbsd.de>
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
 <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
Content-Language: en-US
From: Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Arnd,

On 25/10/24 22:55, Arnd Bergmann wrote:
> I also expect that a lot of users (of m68k kernels) are
> never going to get the benefits as they are already stuck on
> older userspace because of added bloat in new software
> releases. I assume you have better understanding than me
> of what m68k hardware is commonly used these days, and
> how constrained that is in practice.

I second that - currently bisecting to find out what makes my extremely 
RAM constrained m68k system fail to boot or run anything past 6.9-rc4 
(sysvinit, not systemd).

Much as I appreciate Adrian's efforts to keep up with user space 
development, I won't be in a position to help with an ABI change.

Cheers,

     Michael


