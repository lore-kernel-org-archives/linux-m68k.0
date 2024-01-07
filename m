Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A59134A1
	for <linux-m68k@lists.linux-m68k.org>; Sun,  7 Jan 2024 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="cmG0DM2M"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bc4f49a3b6so1439705b6e.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 07 Jan 2024 05:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1704633487; x=1705238287; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ7uDXAAmr0puYLSf6CVOO6ldyBnrL24XwRJb0qVA3g=;
        b=cmG0DM2MsEqgqmTIDWrYS2Ehn1XWRH8A+d5PdvAIJBu8szLlkBVt8VIc0SaQvpRUm3
         xaWm8U3YJV/eWaLawsRd9R0blNDYOovJnw5aiBj6YcdV+nMWGwkBBDChfAcyfAqqFe6L
         TmuQFNIlzXeDpUfFAN2GBZ5HmHx9W97xKPSDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704633487; x=1705238287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQ7uDXAAmr0puYLSf6CVOO6ldyBnrL24XwRJb0qVA3g=;
        b=dusV5RQh80IrgNdvzqkQRyVG06HhcnEXujDjpXQmkCwe2vpzbmzkFv124l8mczSaw6
         DC1BnAkOim+YS8BfCMfNOr0BaHZSEmAT9DkC2meYz2d3LcZyEtKxZJ0SOlltiT+6oYu6
         RzOSZMTXPCVOz8vcW17MNg83ryvpYS8DQ4yidlt6cNGbar/cD8iaIh2aPcI8EiBOdADc
         yK50QfXsxCiyUf3eQLzVEzsI/BX1dEPkrH6XR3ZQtXJg3V1ZjTzNFcbYkqkfYZLB3fGt
         jGroMD53KaTGq8cfyBlKhQ71IFqeznzlH4pM0JbPt+8C++z5Z5Xt9x22PC2v9YyViLPs
         pJZg==
X-Gm-Message-State: AOJu0YyS8YTxK5lx4e8bhZ0Ekgvm960mdRdROQgpSpzq+pwjI2w79YE9
	GJeC7r+XtslT6gYtW2yfx8iYViWJzDkSfTCxNWPYdwI6zL+wbA==
X-Google-Smtp-Source: AGHT+IEqD211Ve0cTZTZRpJxL6Z+iwiEuQX5fLYEIoQr6EnUMsxqUHjiyG7Mw5wc+LX66pgOMEUNst1U+Wmfhu3vkOg=
X-Received: by 2002:a05:6358:93a7:b0:172:98ae:cd35 with SMTP id
 h39-20020a05635893a700b0017298aecd35mr3194744rwb.29.1704633487421; Sun, 07
 Jan 2024 05:18:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240107014248.3651022-1-daniel@0x0f.com>
In-Reply-To: <20240107014248.3651022-1-daniel@0x0f.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sun, 7 Jan 2024 22:17:56 +0900
Message-ID: <CAFr9PX=-eC-FZmmOKK_beFvs05_moe8u0jGPrSyW5Xr=AagmTA@mail.gmail.com>
Subject: Re: [PATCH] m68k: Use macro to generate 68000 interrupt entry sleds
To: gerg@linux-m68k.org, geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi me,

On Sun, 7 Jan 2024 at 10:42, Daniel Palmer <daniel@0x0f.com> wrote:
<snip>
>
> --- a/arch/m68k/68000/ints.c
> +++ b/arch/m68k/68000/ints.c
> +asmlinkage irqreturn_t inthandler65(void);
> +asmlinkage irqreturn_t inthandler66(void);
> +asmlinkage irqreturn_t inthandler67(void);
> +asmlinkage irqreturn_t inthandler68(void);
> +asmlinkage irqreturn_t inthandler69(void);
> +asmlinkage irqreturn_t inthandler70(void);
> +asmlinkage irqreturn_t inthandler71(void);
>
>  /* The 68k family did not have a good way to determine the source
>   * of interrupts until later in the family.  The EC000 core does
> --
> 2.43.0

There is a missing part of this that updates the symbols used when
populating the vector table that I missed when splitting this patch
out.
This will currently cause a build break that I didn't notice because
the change is actually in my tree.
I'll send a v2 if the general idea is ok.

Cheers,

Daniel
