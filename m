Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4EA1F5E6
	for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Jul 2025 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753772927; cv=none; b=b8kKyU62O4BxgJycH2EYPTV5ksUFrBIJPGomKS7hmlerQGU5FMBp97GQ/ow+O+kfreHk6J8d6kD4SR2hgMqCPbEZnc18ZsdG5QoZ2CNc9Fr/mdtI7wv05NaIJGihW1b+gVL4wOAl2ghNWHwPckFqtMXOjquNwSy9QvcZhiHs4q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753772927; c=relaxed/simple;
	bh=qEOp4eAuXtjwqThRUtipER/RVG2D7gK9UTVt7qKgUs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZGUNWpjAeRT1Y9vWoTVT+1vDyg0Qh7NLpFAMQ3bh8/H68ENjs8XCwNSYbO4fgo5oeGNj95Hqvk9ba5UwJ6nGwFwSGMSM7NFbOLjv5G2tU1Hm20T5PARaXw/oclZtjqU1KkxHdRRhU4ni482lmOoWhnmEjD0NRLWo2evU3lKYqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-531426c7139so1942058e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Jul 2025 00:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753772924; x=1754377724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8YtcC/yIgCDEWMFfAtdpI0rgOgUJRQFp+eUsj2IWqc=;
        b=KZdrro2oN+tPEzugqYDVe1aL3L3BHp+9T62pEubHHM1kKE/xsRHT+lYLGWbf+orjd6
         AvP36Z9nLfCv3SdPk6dyZLMOVqUvA3wbdHpFADqFIa+MoQG/HLmrKTi4nkln5Q0yuuq/
         XOWIXVtwNjOldWpxMIf6QVTySX/+Ep78aHiAkG+MKGybvb4HoOiT6pV9rErtTqhfoqY4
         1JFZlKPWX0c5tmCQtFnpBNeYOuzeP1DLU6/euer/uUFn2R1xlXMjQoW++y4noErUX8Hz
         r8WPwTCTmKHoyBh3owukfnkwsg9FxGN//vK1WxuDmpA56Z84F2qRYtRL6kNdw18TERXK
         /Mhw==
X-Gm-Message-State: AOJu0YyY2cIFJ7q9Jr/R1RTvrwB7GSmlKExF+MwWv0nxbnF8vB9VjDzt
	ECXYYSV+VbxdWOKNTQ01NOt1+XOVw4aLWrNM+jwdL7hvUpeNlhVZ1L6dtJj/x/Se
X-Gm-Gg: ASbGncusjm9hTRWbg9G+RVpbO1UNpcK3XIsmUZBCxX95dMmu1QoIx2X/WvP20S838Wd
	QpXy1J6iOPjoIba7/WjPFqy9/LYPC9Vxm1CJ9xXiysbsjWAarHN9pmdIhBZnTS1syQCef/qVBxr
	OwwwJWTrbiT67wrpterlXNx74jgneYv6ladnhYaa3lnFTjuzf3MQ5+89G2KlsfFk6sVuH7ZxKZr
	CkGFKseYRmI4djdJ3jVU5IXqTNtMu6LRtkUzqqcZmuIYcpmHxPvzuUPu2sngI4GYE1XUMqiTNFo
	Ki3gUsJowy13lwSr3M77oKn/pZsAPms5rzqLTb6FK6eJXOSVMwNyahVs9SmMq973dgR74N9E7jo
	pdT618pTH5NaAf4YTf125toUH4jWHWmXhHf0vmz0wjVhuTfIn57vEGIkO2sn5A8vYQ9JXOJQ=
X-Google-Smtp-Source: AGHT+IFCSmiU0+8rQBh/pt3CdZPoBf/ds0CslcyTXIzKJYV3qnHVaj9MfklIshyDlfVALEfy9Z+aew==
X-Received: by 2002:a05:6122:6219:20b0:539:1291:b03 with SMTP id 71dfb90a1353d-53912910cb6mr318959e0c.5.1753772924075;
        Tue, 29 Jul 2025 00:08:44 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-538e261fee5sm1878482e0c.11.2025.07.29.00.08.43
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 00:08:43 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-880f92a63c7so1054564241.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Jul 2025 00:08:43 -0700 (PDT)
X-Received: by 2002:a05:6102:304e:b0:4fb:dcde:3f96 with SMTP id
 ada2fe7eead31-4fbdcde4191mr324280137.8.1753772923410; Tue, 29 Jul 2025
 00:08:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728093412.48065-1-jogidishank503@gmail.com>
In-Reply-To: <20250728093412.48065-1-jogidishank503@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Jul 2025 09:08:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkJrsug-hKkM_f+0xxrPHBQfw_3WB2FhMM=yAYzRn1Eg@mail.gmail.com>
X-Gm-Features: Ac12FXxAEbnb4l6V0uvEPoVTtKnza535a3ryL1k5c8rsxUEbVBR5-jZ6yXaKH1E
Message-ID: <CAMuHMdUkJrsug-hKkM_f+0xxrPHBQfw_3WB2FhMM=yAYzRn1Eg@mail.gmail.com>
Subject: Re: [PATCH] zorro: fix checkpatch error by avoiding assignment in if-statement.
To: Dishank Jogi <jogidishank503@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	darshanrathod475@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Dishank,

On Mon, 28 Jul 2025 at 11:34, Dishank Jogi <jogidishank503@gmail.com> wrote:
> These changes improve code readability and bring the file
> in line with the Linux kernel coding style.
>
> No functional changes.
>
> Signed-off-by: Dishank Jogi <jogidishank503@gmail.com>

Thanks for your patch!

> --- a/drivers/zorro/gen-devlist.c
> +++ b/drivers/zorro/gen-devlist.c
> @@ -44,7 +44,8 @@ main(void)
>
>         while (fgets(line, sizeof(line)-1, stdin)) {
>                 lino++;
> -               if ((c = strchr(line, '\n')))
> +               c = strchr(line, '\n')

As Christophe pointed out, this line lacks a semicolon.
Please do not submit untested patches.

> +               if (c)
>                         *c = 0;
>                 if (!line[0] || line[0] == '#')
>                         continue;
> @@ -68,7 +69,8 @@ main(void)
>                                         fprintf(devf, "\tPRODUCT(%s,%s,\"", manuf, line+1);
>                                         pq(devf, c);
>                                         fputs("\")\n", devf);
> -                               } else goto err;
> +                               } else
> +                                       goto err;

This does not comply with Linux kernel coding style: please use braces
in both branches.

However, in this case I'd rather invert the logic, remove the braces,
and reduce indentation for the big block:

    if (strlen(line) <= 5 || line[5] != ' ')
            goto err;

    [...]

>                                 break;
>                         default:
>                                 goto err;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
