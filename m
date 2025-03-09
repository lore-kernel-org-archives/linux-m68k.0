Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B676026
	for <linux-m68k@vger.kernel.org>; Sun,  9 Mar 2025 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741516996; cv=none; b=ndoDDe1bS7/FUeRkBvNLdmfvAB1lPU0TswTlzlx2a16rVj7q+Phy4UF5IZ6uxMFtqH5xypZoj/sLf/zJ8ptXZjmbvsoO9IEeblrxI1oJpkFAjjzlLm/J/LRCL35X/ccj8Qr3yPoQJbxZeyKZBs5bNn5G+QtGhFxJ+Q6LXA5Acyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741516996; c=relaxed/simple;
	bh=10xCoNFHO437yhFam46zfKM9lmNAgPlpSULGWjmMVxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2p66QeEVMvJekUpIUfaq+uc1/7NQTy84FVXWrlb8h7C1IRsON5wj6nbwji8w/Xfo+IcDVMbxQ3navUJ7wuTPakHooEKtt7m6+J7/egRdpr7QKQ2BgIsQqYOtjjrLqW1u0RvNh9vIKEr40TiJLw8yhrjBj37MOYLkufbSqkYVbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-521b84da5e9so1137664e0c.0
        for <linux-m68k@vger.kernel.org>; Sun, 09 Mar 2025 03:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741516993; x=1742121793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6sVnPjAFlwNcLH1dKbRLjZAgfzH6hNEltwM8LXpTtI=;
        b=ZgPjjk2wnkehqbZJ+IkJYBOXy5VkUCFYNDSBeUyDYEkibn2EXZkVWogxPWEQ8UWRtP
         fQdRSPGNJsLtxfz4Cq1DM9jG47NdOdnzrpuqUT6FJ9s/UFz1th5h0wwdprH2v67LNPxU
         YeboMy+HY5LSrXMJ0hsXvx5amyAaCnAJvshguVxLWmz/H0lLmnoguY0RZOU14cW3PFPQ
         QeB9UMymeOmnh7BPEWb5tTgVv0tED7TR4fOwOh70Q3neBFQ+1sWPv+A9bhfYYRcWRYIu
         j3d0HO0F6iQ/LLajlyO/ztmH1QviYXCdQfnrg+JS8EL9K0W7HXk3GSakTs0USg6zDUGq
         M8IQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8K1JH+VccD5+ONRVOzXaRL8YU6r9rkwdnFZ0+KO+rW8EsLkkXAny15p1+UxavNc4rUEG85u3qflx9@vger.kernel.org
X-Gm-Message-State: AOJu0YwehH1aZ4Z8SdbJaOg+w8YdXQSnG1WFVBrq1dWbn2ASu+A3oO9y
	uUVbapTLqDSy7xw7Jp3oqeLo/GlXa2zrhK+P7MN2wRSduxgVbHKmztvTF4ik
X-Gm-Gg: ASbGncv3pNCpqEiAPhgWa6iiXPY6pQxZVgb49m+ONsSp9z8ygQtfVbqVE2RWw8TdiBg
	/7xVZkCDxnX45SL0mSsu01EfyPWS/snxJjp+T2oe+jbI1Ewd7CCUG2yOS2LkuV1Xe2w/Bym1nHp
	mP9C0uNfU7n8FmNGZ41N+JdQxzeqYB0k/OLLVZQsrxgzcnWAZ9jyFbrTZaQ0EY42VZWpHN/70HZ
	k0UnR5AZNZQcKKwh9+YCWMZrahLzlALnBN5RvwnNkbKmk5wUkFgkkWSC3tTXr9DpJ7UTJcgUpk/
	sk5Br25+33px/OOsHSYPlyhiY0WyKp8WJf9PvVyO+Ck5TMuhE7EgKmF69z1Bq/hx6tMqD6a8VZe
	z1FdW9P4=
X-Google-Smtp-Source: AGHT+IEqD3hB/7xqhBLWGjhYqCi9al5Qt5pFXRgacCg8KT3FZHw0UxjdX9M+evsWZm71OsjOHDuaww==
X-Received: by 2002:a05:6122:a01:b0:520:5185:1c83 with SMTP id 71dfb90a1353d-523e41a680bmr6266215e0c.11.1741516992961;
        Sun, 09 Mar 2025 03:43:12 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d892a9fdsm1224962e0c.0.2025.03.09.03.43.12
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 03:43:12 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86cce5dac90so1407710241.0
        for <linux-m68k@vger.kernel.org>; Sun, 09 Mar 2025 03:43:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVED5nglWSM87y7JZgCrdSWhF7Hly/Aja31W/uyWzKKLvv/xDojXKVeErRkBVBBYRjGebegdSIqiJ/T@vger.kernel.org
X-Received: by 2002:a05:6102:8001:b0:4bb:e8c5:b149 with SMTP id
 ada2fe7eead31-4c30a5ab186mr6505388137.7.1741516992209; Sun, 09 Mar 2025
 03:43:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <10be3c697f6702a63a20219160e671b1920b3d6c.camel@physik.fu-berlin.de>
In-Reply-To: <10be3c697f6702a63a20219160e671b1920b3d6c.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 9 Mar 2025 11:43:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGKPxWVz-Cpz=28wDOQNfdx_=qWjeMJuD8timHeEzkMg@mail.gmail.com>
X-Gm-Features: AQ5f1JopRih3Jy1916KajiPDeSiHNxKgBEGHFhfN1TTD4RURK40dYlMqyILRUJw
Message-ID: <CAMuHMdVGKPxWVz-Cpz=28wDOQNfdx_=qWjeMJuD8timHeEzkMg@mail.gmail.com>
Subject: Re: Alignment discussion wiki page
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: debian-68k <debian-68k@lists.debian.org>, linux-m68k <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Sun, 9 Mar 2025 at 11:38, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> I have started a page on the Debian wiki for discussing the alignment issue:
>
> => https://wiki.debian.org/M68k/Alignment
>
> I will add more information over the coming days.

I am positively surprised by the old SunOS's cc being able to fix
typoes in printed messages (sturct -> struct ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
