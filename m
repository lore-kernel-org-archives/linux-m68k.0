Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F9426AF4
	for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 23:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786749342; cv=none; b=UwS0KuSgs1WgJqDDVdLLJLgOkVO8NzzBvDMWpBMEiOFUTPxTRXtcpsPXYRfqQ5TQhmmeZbBDABaPoD91yPPoyn0vxQVt3M6zVh0tLN1Xa0yg4WIDMH2BfOGrEM9aJdkndjXRlaZ38Yv3QjshD1zxe+PPC7SGwkjQ7HRKXnTObMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786749342; c=relaxed/simple;
	bh=I/uarSh+Yt39CznkLrrJywz9PlnXuGBPGtjCAp/Ougk=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=fokUlsSDBjCQw8u9hCW22SMJMVCNY0eWPziqgL7qUvhtA8IRzRO4E0s4pUXhMr913omH1Y4wHsdnO/rgco2wyRvqZ2298qhElmdHaRvtlo4jvsWGtkrweIsJLdNrR22UYuyn6ZapPOqYCdn5tqKBq7OXepEqtBsd7hlDAbpH3eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKquns30; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKquns30"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc97653887so26186675ad.1
        for <linux-m68k@vger.kernel.org>; Fri, 14 Aug 2026 16:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786749340; x=1787354140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ky5gskAaSEf8NghVHXc5sj5etgnRYYESi/dHNnxk2Lo=;
        b=lKquns303EQphSt1wiWFrZoDL1Yj3ydehnjnUJDrPfTBjjXEhybCAnN73q1n5C1bqJ
         QwnOFY+cbUqpDxTvuAeqEFFNLBMkrn3c06adCBYS78Z/QBTKidZLWS7uMxepGv5pJbWF
         GrJf7v9YsKK5O6mfEdStXfxi8jXx7pm+W0LcdPRwj8TO2WRVESw1FVMOyZifg6xVNcpH
         DR5qd5WoeITl08j/97DF5QyLjL8vpFTebBG0ZpuoxI5X2KZszVcWIaUuUAr1h8yxR6r6
         AJ0rKtHhYBFL/7iUYXQ8BbuCB9Kmg1ByYsXh3xDcRu0lZ2OheON9Z3JSiy0K5ug3fif/
         FXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786749340; x=1787354140;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version
         :user-agent:date:message-id:from:cc:references:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ky5gskAaSEf8NghVHXc5sj5etgnRYYESi/dHNnxk2Lo=;
        b=XSkhuj+jKb+wNjosTtUKcAnTEGrES0iRPdX1z/MvQAvas1c1aXzg62F48dOBAYxd7Q
         /KyBNq59xEt9+16ZfdBByfWOXD0hO5/ndP4TxQliysgvdlwdKxrvxSk9x1Dnv8Hi6O+c
         w+lcaN1U2NEG5FE+j7iPtMd1egXZmstarEc77V8St9n9LKfRVTKazIlKH1gKcDU28WUq
         w3YqIKZzF+n/ImiBQXCVj4hqZaj1MXc/bQ+Xgjx4gg/RBKPWgP2smMte9uuKsGUKlPkc
         WY1BnxRbMuj3oDKAJ1gb1UoaHcvmspTWJuBWTdNq5Ce77eF445MfOCFcbpRAEKm7FdKG
         eaBA==
X-Gm-Message-State: AOJu0Yya7MzESUcpwN+euDZ3wBWXqaICEmZ3OFa1xnkRfRQmoJdMGuZY
	6cQ93LdxaKy22eBTz5sRATp5uUWjFnyFmV/deYCBJwLVx5SNs70twcRB
X-Gm-Gg: AR+sD10xQh6MQ8goZ/pm5yf2mngXFovDIu/a4BrB7VONxNqsB3YwtRn5nSjOalHhU6j
	Is5si8LOw17qFxgufi3AQzlwEWDP6rMKcyCCDndUhuywFXAIIEML74e6OLm7VbANBYCmR/KrCqq
	1Xyb3d6a50rpMKn6UokWDN7vvB4kkuyQ7acVgWhbljBTplvejPZ0AruoKA8mt/ylq+xzs9wNBJ0
	FR/U9mMN8DN4W5DiU0mWddYvFqYD6DO457c6hjKynFGzYCamVVBVjWbUZoBp0XGM45sFs/BgO+/
	/0n2juGamzP6F18DjzP1wOMIcKSamHdex4iSt1xfPOUeSG7pf0OMf4XEAWffuz6FnaNbSExW+R3
	u8wDAovL+f+X7QPxl4Bz2YvDZyqpgMvoyJZvDeGrAsfP97uA8RUGF+q6yroQaLyW+JvBEKRB/rf
	RhDQjw7rU4g7H5phAzbVW7gLEovfTquLmHIEN5MrVEFPi8aEn6Rs+ftyX8ktc3E7U27G7cgnrgv
	PC9zrEBrnfjbleV2P9Xgagn
X-Received: by 2002:a05:6a20:2587:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3cc71c1b66fmr10536211637.1.1786749339907;
        Fri, 14 Aug 2026 16:15:39 -0700 (PDT)
Received: from [10.1.1.24] (222-152-170-159-fibre.sparkbb.co.nz. [222.152.170.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03f9sm8733169eec.19.2026.08.14.16.15.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Aug 2026 16:15:39 -0700 (PDT)
Subject: Re: [PATCH 1/5] m68k: Fix atari mouse movement
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20260814031745.17140-1-schmitzmic@gmail.com>
 <20260814031745.17140-2-schmitzmic@gmail.com>
 <CAMuHMdUDvsqT5t93-ZO413pwS3rPYPB1_uy+5iRHsii8CYTdgA@mail.gmail.com>
Cc: linux-m68k@vger.kernel.org, Miro Kropacek <miro.kropacek@gmail.com>,
 linux-input <linux-input@vger.kernel.org>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <ef9e0128-6309-546a-715a-3e7eb476910e@gmail.com>
Date: Sat, 15 Aug 2026 11:15:33 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUDvsqT5t93-ZO413pwS3rPYPB1_uy+5iRHsii8CYTdgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Geert,

thanks for your review!

Am 14.08.2026 um 19:53 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> CC linux-input
>
> On Fri, 14 Aug 2026 at 05:17, Michael Schmitz <schmitzmic@gmail.com> wrote:
>> From: Miro Kropacek <miro.kropacek@gmail.com>
>>
>> Kernels are built with -funsigned-char since version 6.2, resulting
>> in signed mouse position deltas getting misinterpreted as unsigned.
>>
>> Cast deltas passed in (unsigned) scancode buffer to correctly
>> interpret sign.
>>
>> Fixes: 3bc753c06dd02a35 ("kbuild: treat char as always unsigned")
>> Link: https://lists.debian.org/debian-68k/2026/08/msg00000.html
>> Signed-off-by: Miro Kropacek <miro.kropacek@gmail.com>
>> Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
>
> Since you're now in the path to upstream, you should add your SoB here
> (applies to all patches).
>
>> --- a/drivers/input/mouse/atarimouse.c
>> +++ b/drivers/input/mouse/atarimouse.c
>> @@ -70,9 +70,12 @@ static void atamouse_interrupt(char *buf)
>
> Alternative, you could change/restore the function's signature to take a
> "signed char *".

Agreed, but without a way to test this, I'd rather wait for Miro 
confirming that change also fixed the issue.

Cheers,

	Michael

>>         atari_mouse_buttons = buttons;
>>  #endif
>>
>> -       /* only relative events get here */
>> -       dx = buf[1];
>> -       dy = buf[2];
>> +       /* only relative events get here; the IKBD sends signed 8-bit
>> +        * deltas, and the kernel builds with -funsigned-char since 6.2,
>> +        * so an explicit signed cast is required
>> +        */
>> +       dx = (s8)buf[1];
>> +       dy = (s8)buf[2];
>>
>>         input_report_rel(atamouse_dev, REL_X, dx);
>>         input_report_rel(atamouse_dev, REL_Y, dy);
>
> Regardless:
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
