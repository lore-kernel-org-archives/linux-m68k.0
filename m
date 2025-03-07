Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C6C1E5B6C
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Mar 2025 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339708; cv=none; b=Ie1qlD+EBK8PyRcmJJhYc1Oq92AUhVqpfrqEix13TUSoHaICY2VPgfDH0JoUOkpuM5aiGo/j8fsmT+C1dRiWj4HN9R8DNnVVdJh/7QBARYX1Udc3zzPK9XD20xDuWiIKLbULEAQs6jjqO3uHb0fFL8qCvGhuqTirwvSng3l27gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339708; c=relaxed/simple;
	bh=BN+8eHwcafa3VqJK7m3MNsMWlXODH7acNS4IpcPbG1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bxWklm+921KxpF3eQ7Hn2vNBcIjB5vYOowUS3Wth8JuzReaS9MPeTyaZjSIcZytezAzEMjhc8b/5FU/6CIDa/VrJIs0w2icfKEhxVjdoSTkqs1TDpT8AHqWp6jd9KK65ysEtwu6BZKAq4mUhe7mS+ynTJfwbCOw0A0RVHyyyX2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-523dc366e42so622460e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Mar 2025 01:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339705; x=1741944505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoQKfUSlRz0+YvdMZUS1l/LJsywoVzRWedSGJvmjWs8=;
        b=VWDja/qpooSlnraRp7MYIEOjUTK2EHNXKHcwUk+Bt5bn5zNyuVuZtWqf3CR8fl9mBQ
         OrBZ7j8chJMWo8YYhiV2DPeHqQfTs36F9khQr2vbjKori2K8a9yFgv0XjrLgYqJ2J1eu
         82BI7AMMrS10f1Bzec0rhQh5+xzNLMInOrUa/gejibkH/+LRwOL6FhL8mEfkJsKVwx+i
         RwWBkSOv9BKE3ZeHnIekhGn6eNoeHSlZZTO3wQFQuOjPbWalUkupFBzm9/ZVVQ7qffQi
         72x3xhYCRKf9H7JzjBdCyjkt/BvEYFAA0pJsvFOX6LF+Te3xW/tMbAfcqwi4qWDMK6yg
         JgcA==
X-Forwarded-Encrypted: i=1; AJvYcCXy8RrkVNAXNNNhz8QxiTg+Yr57du2WEUFMPLwLZF+0Hqe/OdREEvrQLgemlwE8SMMNY/yxuuW6SX/6@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzlrjfLUGNJNsert7w2IxFSlyJdP9YUP3bgMxEBGA6USqp7ley1
	SKeIT7smV80p6+E0Ff+MyN4UHAsbPfSzLDxYkHtRnwAnCwhogc1kZlLZhlEn1mM=
X-Gm-Gg: ASbGnct7dKSFt1t9J5i40s71CdTFJP869w6TAxpMKfHh2h3Jn6P6jZtVJI2TAVKZlSm
	F1fs5ldvwEBt6sL2Q6xsXqknEnwtjOBwqrlYiNRvftubzoNxSurWqUqKGyyv9feqScUuGTcJ1be
	9+Wrz1H6KKl/JHZO0CYl/j4r6jCTWCtaw1BQ7qTVYv1aGOtdWRt4SNX8RjFa1ZX2R0EYox8K3oy
	jYDCz+kFenYhKXIyu6gtZrNovfAjsPIGhjXhWnNOgL/UG3dSCn+HltGCu2I5lhzvFTr9xr4YRlp
	rYhubrMyYH+J8C/cMtoWR/ca9l1/iKkNkB69jAngujJDCFWHHmDk3hohi2h46XniWk2kIBZyzaE
	w9TQiXozXVvg=
X-Google-Smtp-Source: AGHT+IEye3Xvlp6J3RJdUMfOiuwJkvdDsWMM8hEClnEHgAzxBUBUinvFqBNZdh/z+K/KikMsXshGuQ==
X-Received: by 2002:a05:6102:5e91:b0:4bb:c24b:b644 with SMTP id ada2fe7eead31-4c30a6ad045mr1298272137.20.1741339705083;
        Fri, 07 Mar 2025 01:28:25 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d33ca78b4sm622284241.24.2025.03.07.01.28.24
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 01:28:24 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-523dc190f95so645229e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Mar 2025 01:28:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgY7ukVo1h24gjkX1KTkjlu2K3boXZL9sxbQSX962PeYaFiFucsVadiCYFcRmK4K4NkmuFZuN0cE+n@lists.linux-m68k.org
X-Received: by 2002:a05:6102:3c9f:b0:4c1:86a7:74e9 with SMTP id
 ada2fe7eead31-4c30a5abef0mr1501844137.10.1741339704649; Fri, 07 Mar 2025
 01:28:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302230532.245884-2-thorsten.blum@linux.dev>
 <CAMuHMdUonC54g-XSt-EkNbEGxhkOWMxBc87Qtw0MyeXoPqDD4A@mail.gmail.com>
 <e5e10808-5cca-243b-304f-4aa8db1d30b6@linux-m68k.org> <CAMuHMdWjOkUXy+jf0yghs2_SQM3UWY3e8or3T11=fXYYD-VJEw@mail.gmail.com>
 <dd1425d0-6d46-86a7-b508-ff0a646d61c0@linux-m68k.org>
In-Reply-To: <dd1425d0-6d46-86a7-b508-ff0a646d61c0@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Mar 2025 10:28:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX=2FnC1OzxcQp4RMG=Bk3aiQ4OprYjLde3qUP6XH7yog@mail.gmail.com>
X-Gm-Features: AQ5f1Jolhp06vsDYkRjEdux0qCD5TaknfsVx0Aii3j3HwQ68d1rTYnRPVv095nY
Message-ID: <CAMuHMdX=2FnC1OzxcQp4RMG=Bk3aiQ4OprYjLde3qUP6XH7yog@mail.gmail.com>
Subject: Re: [PATCH] m68k: mm: Remove size argument when calling strscpy()
To: Finn Thain <fthain@linux-m68k.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Finn,

On Fri, 7 Mar 2025 at 09:58, Finn Thain <fthain@linux-m68k.org> wrote:
> On Fri, 7 Mar 2025, Geert Uytterhoeven wrote:
> > On Fri, 7 Mar 2025 at 00:24, Finn Thain <fthain@linux-m68k.org> wrote:
> > > On Thu, 6 Mar 2025, Geert Uytterhoeven wrote:
> > > > On Mon, 3 Mar 2025 at 00:07, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> > > > > The size parameter of strscpy() is optional and specifying the
> > > > > size of the destination buffer is unnecessary. Remove it to
> > > > > simplify the code.
> > > > >
> > > > > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > > >
> > > > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org> i.e. will
> > > > queue in the m68k tree for v6.15.
> > >
> > > The commit message says "simplify the code" which is only true if you
> > > never scratch the surface (i.e. it's simple code if the reader is
> > > simple too...)
> >
> > The code is simpler in the sense that the API is simpler to use, and
> > harder to abuse (i.e. to get it wrong).
> >
> > > Commit 30035e45753b ("string: provide strscpy()") was a good idea. It
> > > was easily auditable. But that's not what we have now.
> > >
> > > Patches like this one (which appear across the whole tree) need
> > > reviewers (lots of them) that know what kind of a bounds check you end
> > > up with when you ask an arbitary compiler to evaluate this:
> > >
> > > sizeof(dst) + __must_be_array(dst) + __must_be_cstr(dst) +
> > > __must_be_cstr(src)
> > >
> > > Frankly, I can't be sure. But it's a serious question, and not what
> > > I'd call a "simple" one.
> >
> > All the __must_be_*() macros evaluate to zero when true, and cause a
> > build failure when false.
>
> It seems to me that the code review problem could be solved either by not
> churning the whole tree, or if we must have the churn, by short-circuiting
> the recursive search by reviewers for macro definitions.
>
> Can we do something like this?
>
> sizeof(dst) * !!__must_be_array(dst) * !!__must_be_cstr(dst) * !!__must_be_cstr(src)

x * !!0 = 0

So either the above should be changed to

    sizeof(dst) * !__must_be_array(dst) * !__must_be_cstr(dst) *
!__must_be_cstr(src)

or all __must_be_*() macros should be changed to invert their return values...

> At first glance multiplication appears to be safe (unlike all the addition
> terms that we have) because the limit of the string copy is either
> unchanged or zeroed.
>
> Yes, I know you said "zero when true". That looks like another design flaw
> to me. But maybe I'm missing something that's more important than
> readability and ease of review.

We had

    #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) +
__must_be_array(arr))

for ages...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
