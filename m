Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D363C65FD
	for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Aug 2026 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161932; cv=none; b=kNzYXaUlhYN5VIU9cf7JM7piCiRQAQz33HNLHsx1AM08pJK7bVklSlOezWQb/Y49EUme25PNJCXoZtuVFvT30McAUBWd3ki62xUEIDo2xxhy5c8J8CzqzqK/nL8rbbVkdmeT2MGAr11uT7dfxa4IaOnLi25XOVXyDdVDcexmoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161932; c=relaxed/simple;
	bh=n+bm+oD3kn40fyS7L0liJo1kS7q5/LI+20B3up/88HQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKxxy765LIZP+ebKowFpNhh1HTwSRZbEruj3CKr7nOTTmW5K54qiJiy/6tORiisMDHiVKvObZnbpQcKISQCkVW0YmYTsJKlZq3lqH1Wr40LwNPYS2dBvenwNJ/L0vVd78ws3/5XgfmJNQ+0FGBrnevQaMWoUDh6U530H/IxVv3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7466771f1caso690880137.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Aug 2026 00:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161929; x=1788766729;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1+Wb6c4hy/mllkEGw9UkJDy4J8V6hEIxHDRjaIVv61Q=;
        b=gaExAyA2vP3mUzvXxNgWArV2/s1F3CLlCHiEawc7b3ZbHaPciZRx6/dwIP5pKaqak2
         Ql3lLucv/RtoceS6Mcn+BqM2PKWzVsuYONPWakw8JBfL83PT2kFg96eo3BY4SnqdtJVg
         gj/zpZjrhwZbvafeym5duY3GBS1UelLvFXnAx5UT2WrWs2JgkGNTDiTWlWujIol19i+H
         MBG6vw4lpLNHaBg2xgSLB9RzExFYv0r8biHc5hJ7kOYBAcdTxETZMVJNBIBQaUzUzhdX
         40gioiIFKkpY8xQGA4/RTrnE7lLmh694VMS6jP7HTfaaY33Fui1gtwxhyROSdj4Hohjl
         gB7A==
X-Forwarded-Encrypted: i=1; AHgh+Rq95MQsp7on73sZYga7SiSLc+BqHR8YMNripcTXtlmrYdqPnwGCN2fd7TcqvW6yHTdopFQyeV7Os23t@lists.linux-m68k.org
X-Gm-Message-State: AFuF++k/nCRvBJdhkbUm3itmRanQtc4HnON5cNLv9cA1dlRYZ3gkNHI1
	/m1yGfBzw2GpmQlF3ZlcxnygWUijOzhYw5wcc2JGh0KiB2nzgqOzIc0G2dNDT4qy
X-Gm-Gg: AR+sD10JOY6lIjDWfwm4e5W6u/XMPhP6Uv2CO3iiW+0I29YTf1nnX7lHbwrrZM/SFmh
	VO3MCR1hAUuf/tVhi8g5szagAQRbl1HJ8I653P9oua2VZZ8vYMAcVOtqSuR644BIsNheiuRJ5sA
	NJ/e0bw7p53ZyBFcAJNbaD0cFecK0GdlWqWD72/pHRCqrbBXX/11uqSGSYR9fr/mlwPjJVAUwpO
	o57Lef8UDvd7eeXdCKzKGshVe1KJlM1E32TriMBVERdEL7bv8ksk/PBsBdk5RMbNPyOSgK/IQXB
	xvoRwkFTtXLdYqqywSDi/lJnyyT7+3SrEuX6knE8SNVShY4B/POaDPKrmfPBTTR+jTQ0c+d29gN
	xuEGbx41AeBOiNh9wiY+sve9qm0uqjiB2KMwFksvEF7c83iG8JxpyYHhh8Aimibcmur9Y9OHYXF
	5wSIJZOjT/DmGyW9/OFsBJArCDazIKPJGmXR4hgF2ZlJDjKqdO/2ny3oOZwWo5b15yiJotmu7hp
	M6Piv5kmA+jFahnO9do8q/aGNMR+++YSd4B
X-Received: by 2002:a05:6102:c09:b0:77a:d089:3dd8 with SMTP id ada2fe7eead31-78599574ec0mr7525069137.12.1788161929028;
        Mon, 31 Aug 2026 00:38:49 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f7bfb6e4sm6008320137.11.2026.08.31.00.38.48
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:38:48 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-74ab6c88052so809248137.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 Aug 2026 00:38:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqPQVvOxMOUflbnt9Zf/3GR6YqAdTT0uchw04zes6hEnP2DaJxc0k125p7gm7bVcBbtJJvEo2a1fI+D@lists.linux-m68k.org
X-Received: by 2002:a05:6102:418b:b0:778:721:53db with SMTP id
 ada2fe7eead31-7859426191emr7077458137.0.1788161923583; Mon, 31 Aug 2026
 00:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786929430.git.fthain@linux-m68k.org> <1e349506a7cc6aa574aacbd4c69c240b5a1e3eb8.1786929430.git.fthain@linux-m68k.org>
In-Reply-To: <1e349506a7cc6aa574aacbd4c69c240b5a1e3eb8.1786929430.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 09:38:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXgtstGtcbRkrtKtQ+d1c=mCe5zgYZCx4dyUQ_YnVhbbw@mail.gmail.com>
X-Gm-Features: AcwNN1XVC3wu-2rZS0i2vSr8DmQmHBettg6W2uihbfihhqw2AlLs5EB1RzHcC7M
Message-ID: <CAMuHMdXgtstGtcbRkrtKtQ+d1c=mCe5zgYZCx4dyUQ_YnVhbbw@mail.gmail.com>
Subject: Re: [PATCH v2 07/32] swim: Enable clock divider only where appropriate
To: Finn Thain <fthain@linux-m68k.org>
Cc: Jens Axboe <axboe@kernel.dk>, Laurent Vivier <laurent@vivier.eu>, 
	Joshua Thompson <funaho@jurai.org>, linux-block@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

Thanks for your patch!

On Mon, 17 Aug 2026 at 03:55, Finn Thain <fthain@linux-m68k.org> wrote:
> Some models have a 16 MHz FCLK oscillator and others 32 MHz. Put this
> information into the swim device platform_data so that the driver can
> correctly enable the clock divider. When this is enabled incorrectly,
> nothing can be read and failures from the Error Correction Machine are
> flagged in the error register.
>
> This is chip initialization, so do this in swim_floppy_init() rather
> than floppy_open(). Drop the udelay() which was apparently copied and
> pasted from swim3.c, where it relates to interrupts (of which this chip
> has none).

This move should be a separate patch.

> Cc: Joshua Thompson <funaho@jurai.org>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Fixes: 8852ecd97488 ("m68k: mac - Add SWIM floppy support")
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>  arch/m68k/mac/config.c | 31 ++++++++++++++++++++++++++++++-

For the m68k part:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/mac/config.c
> +++ b/arch/m68k/mac/config.c
> @@ -984,8 +984,37 @@ static int __init mac_platform_init(void)
>                         .start = swim_base,
>                         .end   = swim_base + 0x1FFF,
>                 };
> +               unsigned int data = 0;

Nit: in the absence of a real platform_data structure, please use a
more explanatory name.

Perhaps s/data/s_fclk/, and store S_FCLK_DIV2 or zero?
Or s/data/setup/, and store the full register value?

> --- a/drivers/block/swim.c
> +++ b/drivers/block/swim.c

> @@ -807,8 +806,10 @@ static void swim_set_parameters(struct swim __iomem *base)
>                 swim_write(base, parameter, mem[i]);
>  }
>
> -static int swim_floppy_init(struct swim_priv *swd)
> +static int swim_floppy_init(struct platform_device *pdev)
>  {
> +       struct swim_priv *swd = platform_get_drvdata(pdev);
> +       unsigned int *data = pdev->dev.platform_data;

Likewise.

>         struct queue_limits lim = {
>                 .features               = BLK_FEAT_ROTATIONAL,
>         };
> @@ -816,6 +817,8 @@ static int swim_floppy_init(struct swim_priv *swd)
>         int drive;
>         struct swim __iomem *base = swd->base;
>
> +       swim_write(base, setup, S_IBM_DRIVE | (*data ? S_FCLK_DIV2 : 0));
> +
>         swim_set_parameters(base);
>
>         /* scan floppy drives */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
