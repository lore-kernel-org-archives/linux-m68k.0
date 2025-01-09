Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66B72153E1
	for <linux-m68k@lists.linux-m68k.org>; Thu,  9 Jan 2025 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418691; cv=none; b=ij9bCZvYxSqolKEXDeG49Vl3tGrTDJa+Jq5txBxiW7meaFE0nTkXRlLISJOt7GZnzUJ9tJ6jiThl1QybyxomrYC+g84Vf0Vt4J18ATFVwA/D1tGWtIiv97k/+fpwr4o/9+jwVHgevZ1yqpLAvD40n37yPzHvrHw7RQEhlopOi+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418691; c=relaxed/simple;
	bh=Du+UkIZ02/lK2kwgvoUzvj9u/YsH5BI8Xq5+KUNfwc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JU9DQdrjVd5hicL16wqmWDMQ+0GI79DdjMBOjtKI0rP+wpwN/c/0qcvS9QE/DuJUense76WgZCmSBfJe2pH2kCDeIo3riOJg+1nU/l7HaANwlYCbFgDm9OfuRQAM1+GG1S0kBt6dXJQeY6rK622UheEiGkbOk8uUZ7n9PwvyXSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-51878d9511bso262003e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jan 2025 02:31:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736418684; x=1737023484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VkU4smXBtM5h2Z5OhgLwEq4xeNydXQUkbjhGGCTU1o=;
        b=ZPyxKUOSMR3PnR3jGtylT3KZWodZam3KXmzWkLYONRJdBUtFWtJWG8AIYz/ZpL19uE
         K8SXTKqjMz81wUHdqjd31W+dmjt06e41mkwUpHiTfaRfymkrsd8ssLiUwQ3cwN1Nua21
         //tw+J2CaVv3Z5KeWJhRpmmo676RSGu5W/M3/rTbb1sAmxUN7bkLmBhMUfq8Bgaj7Nvz
         pSsfmIX9KYN0Bjr1rKnaZn8ToIDB/QFf5hR/ZcbYCchT+x6cGJ1NHSG0IkHpYbQOf5qM
         exZKwSsdAT1upB6Fz9E1+/JXslyZYfih25pVYk0cJ5DzgutjaKOeGAAlmThIZ4JgNE+X
         w3WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFjvD1eN/ix9DXjYJVgyKZWcihKNtbDXguUsytcf5ZQhZLXfsthu4fv88JqpJSTJ0NvhqX5jE6N0Nt@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwAOFSTN67HEJJ4+xTIy8dG9F/quKAXXXjWFUW2yKeyP9O4O5Pk
	U5KjdGCfdGLO3FGJGJE/9SOmuzlgn+C52sVxNiUiH1J0yS5SW9Aik6+mMsi+
X-Gm-Gg: ASbGncuJlPpyn2jZcQn54Q1WWIqxCmI5FvbHi23CSbRtvBGb4OPQBjkq4tAPoexonI5
	FuLFVsPqTNGNOrAw4mOtXTU3SHK3Ct/m13cDZFk8kLfJEXgMbp4sIbBwBeaUlOTDg2ArcuHIO+f
	Ku+zpHNtaGdQ3Yeuch977T+VC1ivtktrxEC6hF/uiUIR/pZUCNeOFKaL2vk6xVCm4v9EJ2x9hNq
	Ijq2Dr+CEcTcr7sw2n9WOx12ZrsqTYBzifS5prCB2YR6rzZ4rR8QeZJQhXzuSRKC7FxKWW0vf3J
	sKJdt/OJ7JIJmLzfvWigqSM=
X-Google-Smtp-Source: AGHT+IG5qKOwO44c4+Ji8IEFN+ApvYfy7mtWhENMTmpSbVP2Z17CS3nTaJuagCaVxlNa2JBivQgjkQ==
X-Received: by 2002:a05:6122:3c43:b0:516:157c:a72e with SMTP id 71dfb90a1353d-51c6c4303camr4226940e0c.3.1736418684052;
        Thu, 09 Jan 2025 02:31:24 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fd03b23sm517753e0c.40.2025.01.09.02.31.23
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 02:31:23 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51878d9511bso261976e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 09 Jan 2025 02:31:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpanqv80Ga2yXPglqGCGB7t9uhtN6zB15LS5in0oL+MQub0D8q+m7M+TGJFDQ2LZincSWKymwcqL+7@lists.linux-m68k.org
X-Received: by 2002:a05:6122:2a08:b0:516:18cd:c1fc with SMTP id
 71dfb90a1353d-51c6c5259aemr3812740e0c.8.1736418683284; Thu, 09 Jan 2025
 02:31:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105071433.3943289-1-daniel@0x0f.com>
In-Reply-To: <20250105071433.3943289-1-daniel@0x0f.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jan 2025 11:31:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXU=nhd=fQLSmZQPey=uwD11w=mm=Q25ZWwbNQC1Ys=Cw@mail.gmail.com>
X-Gm-Features: AbW1kvY713J0WZt3O6Kdv9-9baAxtni_SKE_zWUi7GCBY6Vu7wE-b-Ik4RUlgd4
Message-ID: <CAMuHMdXU=nhd=fQLSmZQPey=uwD11w=mm=Q25ZWwbNQC1Ys=Cw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] m68k goes DT
To: Daniel Palmer <daniel@0x0f.com>
Cc: fthain@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Sun, Jan 5, 2025 at 8:15=E2=80=AFAM Daniel Palmer <daniel@0x0f.com> wrot=
e:
> - The head.S code sometimes gets stuck setting up the mmu on my MVME147 w=
hen
>   the kernel binary layout changes. I thought for a long time my new code=
 was
>   wrong but then discovered just making the kernel bigger by adding some =
printk()s
>   also caused it.

What is your kernel size?  Perhaps the code to map 8 or 16 MiB of
the first memory chunk doesn't work on 68030?

There could also be some alignment issues.  IIRC, there is code that
expects the FDT to be 8-byte aligned.

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
