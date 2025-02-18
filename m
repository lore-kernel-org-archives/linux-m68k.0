Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD7D22CBD7
	for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739866703; cv=none; b=B3rrk27w4eyUJVMrvL8dkcqZlIQIu9PS/iOwDPnNIPgI09jRcZUIQOfKkJIvpSkzwdWFdlYneOxUP22q8bMvVkPPKJM0n1Pr/2hbyC1uNytoD0jkQrEH9z2SBgdKzFjoZDB4bFeOln6DN3unlvkFO0K4uuCQKyT4HEg3Tbkpsr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739866703; c=relaxed/simple;
	bh=2VBYXOW5In6lit0F1gJahtZuGAfHYPipCEI5SAdDqvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQqwTwUSIoBH/dBPpKWRgH4y2KpU5/y7/ur/kuAbv8qoAh+xVcgIGEP8dRYbX+xPWrKsslLyBma7+Q5b3TDLxn1SLDZMQWFTjp8iRbLN0gkqYdLx+EclT60NXuylmLjn6P5tC+Kt6TiDHbx5GOvWNv5oVIF68ZFL2Nca7a3E8rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-520a473d2adso1529252e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 00:18:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739866700; x=1740471500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VT68uUFOtiLM/j4EB1RwnCT+0lIJjD9PLyVD0uYr2cM=;
        b=HOTrzwR/SNm0FpuuAs7tHADujwqgf4RtEbiS7Pm0bsxZDCxS52/9its62NgkOSv89a
         hdifS/OWObk2MlNqAgF17ycTrbPI07WRZBIZYUhbRHfrX/lc3H2fEjssnAf7e5cs3mYB
         i6GDHa+UAnL5UuEVi7nWD7g9LAJ0Fju0Pdxwc58ulJY/Jt321t4FjSeLpwgMvH6qCJ3n
         zB6q9qKDuUP9Oww1xgi2bUrY6U3mud5Jmw6/hAI11LBRDAuGnArUDlVoRDg+zPc1+rJ6
         gF5cvBPJic/xjSfjnahNpf7pPvu5khe5LRXBkEM4bzL7ctOPai29yOmfZ+XTpjUAhGyU
         Tw/g==
X-Forwarded-Encrypted: i=1; AJvYcCWRIVP62Dfqu1qyET3phlBvX1SvqsQt5byuzAeEBM0+B3nEB6eTuuWg+0woVXV38YqbwbZJNKqeJZMB@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YyAqfEv+4OJSqVlFJLna9xQhcvZyEDbuHrWYoZVQwMDmjBa1ERP
	/ElUHyNWvL2fEziL3Oeh7dpHtFb1Z4sglckMeXedjPS+ooDbCUag+WW1yO+s6v0=
X-Gm-Gg: ASbGncuX6i3Ac5APE13a6dXGFerJTQHiOG30KG1XLUcA+BOf0RHVAMsqyZktTGxH39w
	27EyQUktXxK6kJFKa6zMAfWt+hhPcNEFEEc+/w8SoGhIVRo/dm7mZvsJBHYHP+FSpBXLAZmTcFD
	9uykd7INri6Ac61l48nC5fSJSXo8vxLObcJRhWHnwTRVpElG2ETElt6JZFWMTcVD1i65UKAL89P
	CC2TLNyZcO1/osSwg27BZmFgrk1VjQG/HWOF6KaI9LfvnPHldCmVyITcZRkfr9vT6cMnw7l/c2g
	PK3tRdjLMSlQsOBdSg89RW/xIjFK9XCbtZTj3e20hzI3yX8mMu81SQ==
X-Google-Smtp-Source: AGHT+IEEYsfOQ7VNr1WFwD4XwM981v1Kes+7DIEdb8jnEVok4KHSrpihlmcJtjnF73DiWVlZ23r0Mg==
X-Received: by 2002:a05:6122:d16:b0:520:5185:1c71 with SMTP id 71dfb90a1353d-5209dc4dab0mr6852408e0c.7.1739866699656;
        Tue, 18 Feb 2025 00:18:19 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-520b9a3aca3sm987547e0c.20.2025.02.18.00.18.19
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 00:18:19 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86929964ed3so784175241.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 18 Feb 2025 00:18:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7cKbKLlGTp1Gtrl2L+WAM12u1ZslZtosoJZKdH8oFvBVLG3jGNIIPzntcxIRwEpaGtItNno0cpBcX@lists.linux-m68k.org
X-Received: by 2002:a67:e7c3:0:b0:4b1:1eb5:8ee5 with SMTP id
 ada2fe7eead31-4bd40001d6amr6978606137.25.1739866699350; Tue, 18 Feb 2025
 00:18:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217160017.2375536-1-haoxiang_li2024@163.com>
In-Reply-To: <20250217160017.2375536-1-haoxiang_li2024@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Feb 2025 09:18:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUs_2mB5RFga8Dv7xPp5VFMaXqykJShndTW-_Q8hgUYfw@mail.gmail.com>
X-Gm-Features: AWEUYZlXeXLAPjROcl_yxFn5h2lk18a3_Wom0kri1EP69xrAxJlcBNWCh-TcD_A
Message-ID: <CAMuHMdUs_2mB5RFga8Dv7xPp5VFMaXqykJShndTW-_Q8hgUYfw@mail.gmail.com>
Subject: Re: [PATCH] m68k: sun3: Add check for __pgd_alloc()
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: sammy@sammy.net, zhengqi.arch@bytedance.com, akpm@linux-foundation.org, 
	dave.hansen@linux.intel.com, kevin.brodsky@arm.com, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Feb 2025 at 17:00, Haoxiang Li <haoxiang_li2024@163.com> wrote:
> Add check for the return value of __pgd_alloc() in
> pgd_alloc() to prevent null pointer dereference.
>
> Fixes: a9b3c355c2e6 ("asm-generic: pgalloc: provide generic __pgd_{alloc,free}")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

As akpm has already taken this:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
