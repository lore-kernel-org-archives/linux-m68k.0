Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98251EF0B7
	for <linux-m68k@lists.linux-m68k.org>; Tue,  8 Oct 2024 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370671; cv=none; b=Y7GlYZHgY9zfELIwlzITH8JAUNxuCSu3SxOLUWjz8O6eNBE3hySiB6EE62fQnJal8ly20BAMR3Wze7Fm80PURXC6WMmmkGOfim3ZqBJA10fjb71tT07N60+BUlNxmWFoXbZlcjmZ6NvYFclaHNv9lyukgZb7zJKCoYy0yTxH7kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370671; c=relaxed/simple;
	bh=SyU94rkfKoXJiBl0fN8X11JbU7QWwLK7QcH2b+/qBfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAs4exZPLnWpZUZ17QC32zgiTdqHiahCg3S5y7yzLeScBhblM4/qcjiATcVnMeplq1jHOXQd7m1AsmdI62j5q8nbrw9SYVNAkhdP/SE42Ouw2WJRDIaZDAe65ESOLgQzmc49dBG7YJ1S8nLnxa7Yu46IxOQtMnqzkOMvAXsopRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2b9e945b9so43824287b3.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Oct 2024 23:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370667; x=1728975467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHYT7MBmSOZv+u8sV5s5vdJ0rOWyrq6tZ659w5YChk8=;
        b=KsT2Fqi1SzhtgGRAwePqXVslJbjDGyLbiQiPWm0i0707p96QsUU4ZJ/Umx+3RnKAQy
         ge6oU86hjt5EUKvEav+Lt4FvzLdUUUZcj+QORtfYCRf3sCX6U9iwqkVwdmCTwuxOdHEa
         uXnqw46BOn64xDZV+iSj+kqoGp2Jfv5F4Youh5qmf34+Ksr8zkGSagIfcC2HkmdsNKpI
         8+KJmqffZbnOD7+ZA7TXEyCbLIuEMpGVHgou769T31nsI5kIlJNThX6ExhYg6hC3ZyBE
         IsK2bAqHJ4HqFuuMHu/kXDQMjVxy1E58Bnn0dJrX+eoJMtHoyQxPdhq1bNyptZ7NpR/C
         J/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCW+AYSk7xfol874IZ2M5/1WpsU9EPJz663qVf6vJ7RFGX4mH8Y5+7rJCfxfhXKD+3TILJfCWDin1Mfh@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YymnAYEo48Pi2kSlxcHxJw6oQOaP1R/ubR7trOEArau35yzqYnC
	xThr0Wv/Fi0MeGFS843IN96kuJSInnbzGEP0pqBK9L5Lpnppbdx8T8mhu3sE
X-Google-Smtp-Source: AGHT+IFJCl4VAQcjY3HC3eGnCPjmMSgDFaLFwpIqOIVqjxLif8UYSuU9SdSfpH5G9QpNtFXlsN75mQ==
X-Received: by 2002:a05:690c:d88:b0:6af:a6aa:2b3a with SMTP id 00721157ae682-6e2c6fcb2a6mr119017567b3.1.1728370667052;
        Mon, 07 Oct 2024 23:57:47 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e30c0ffc47sm3253457b3.142.2024.10.07.23.57.46
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 23:57:46 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6dde476d3dfso41327267b3.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Oct 2024 23:57:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNZQoxtrUyzn9+tQxuhoIHVSM7fERUeEYf7IWtvVjVZqacfLx2e2aGSYEUUEX/QphDAD9Vb/WC1Pgq@lists.linux-m68k.org
X-Received: by 2002:a05:690c:2a93:b0:6af:eaaf:2527 with SMTP id
 00721157ae682-6e2c7024d93mr81351197b3.18.1728370665811; Mon, 07 Oct 2024
 23:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728340717.git.fthain@linux-m68k.org> <fb25eb97521363ab8a18d2fd499cb4c76209cebf.1728340717.git.fthain@linux-m68k.org>
In-Reply-To: <fb25eb97521363ab8a18d2fd499cb4c76209cebf.1728340717.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Oct 2024 08:57:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsekSXJOEf6chaMBHiRt_4nNvKYOOmQVC=ODg0qccKKA@mail.gmail.com>
Message-ID: <CAMuHMdXsekSXJOEf6chaMBHiRt_4nNvKYOOmQVC=ODg0qccKKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rtc: m48t59: Use platform_data struct for year
 offset value
To: Finn Thain <fthain@linux-m68k.org>
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Palmer <daniel@0x0f.com>, 
	Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
	linux-rtc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Tue, Oct 8, 2024 at 12:43=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> Instead of hard-coded values and ifdefs, store the year offset in the
> platform_data struct.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> --- a/include/linux/rtc/m48t59.h
> +++ b/include/linux/rtc/m48t59.h
> @@ -56,6 +56,9 @@ struct m48t59_plat_data {
>         void __iomem *ioaddr;
>         /* offset to RTC registers, automatically set according to the ty=
pe */
>         unsigned int offset;
> +
> +       /* YY digits (in RTC) are offset, i.e. year is 1900 + yy_offset +=
 YY */
> +       time64_t yy_offset;

time64_t sounds like overkill to me...

>  };
>
>  #endif /* _LINUX_RTC_M48T59_H_ */

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
