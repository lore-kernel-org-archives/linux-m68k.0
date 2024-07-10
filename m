Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C812078281
	for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jul 2024 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720595312; cv=none; b=BUYIUGUzUKRBiXz6RkMaquTxgSwTAQNLMyNMYHhmTFDzIQG7MEaOvnt6qnaM+7yMlcILqxG3+2WfetIIXsW7jSDPgdRh/c8vn/2Bzr+jBdEow5AESRNB0+Ru/ZgFfbcN2lA+70dEVrCuFzp/bNtngHdxdnWvNBLKC9bLgD2lN/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720595312; c=relaxed/simple;
	bh=7fvadA7RITC+QOAAEDu3n12JpxuRRxQSkjN/yN3J26o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sx2bregU8m6xST36tPizJJkIV7SlJgai1l0xF4HSvUgiGWZFPPJY2DTyZu9Vtogym0udlIZ0jdKTc1ueBiHu1jGnIC4HmvoO5poHxS3MMv0JIOACRtGn0G4MruOIT7coRQjWzib4nmP3Uz3h7Y5kzlOOFndT33RwvDm+f2yx2Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e035f4e3473so5434454276.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jul 2024 00:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720595309; x=1721200109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qNitUXgc1yU9l8j8hg9vBWdghaTni/Euzxu3xsiqKs=;
        b=N6adOz1N5jVZ+JBtl7LJjcFxzqf8ylYmg3itLXCxkkEmFgs38ThYgzsU4rthRve62/
         yVOKuLyzlIuX7uC8jfW6yAgCeI07YmNb0ddC1KyIMy+/pHCJvgYehJMCT4DthjgzC75F
         HDbHBxBqhvYbG0r2WO3BSkksjhGud8lwzdJOCORPiF4Yg+Tlda9dqpYvizLv3FFbYjAn
         5n/1WJOnjqUEp63Y77fE3pK9nUXDXGt/NYx5lj5SYgfhA0rcJa23hkLy0xtZCyzQk3Vg
         G0F4lx6RrXxk6/vMc3z/t/6DvE5ln9XtP8lvEQVq/nMQSX5onn6/XaZ+GlJpLRcTDXT5
         ZLLw==
X-Forwarded-Encrypted: i=1; AJvYcCUcl9pmFKuYZ8FZouglxxB1QYE6eyKSMX7JtnkAWU6QB8tWxv+EfUUWsUBwF4+ud7BUtfwUPtkOVrdi6Bigf3nUtwQx9Xgeb1yX2R37D+UW
X-Gm-Message-State: AOJu0YxNwfsB0rNTgTyMr9LrVxyxR4jLA+OnnHi73zDFm0A7Umu+KsFa
	zcA3H11Beuum8qmAhrVtgFqJhrhyhO4oitrG642TuCaHzv8xQmTovThx6FEE
X-Google-Smtp-Source: AGHT+IHzxHfPyfChZAd059beZUEJXBag+DhBhYNxsnkSnaCC4QWm/pPs/2TNKwWC/vdTeFmprmFm+w==
X-Received: by 2002:a25:aa6e:0:b0:df7:9946:b32c with SMTP id 3f1490d57ef6-e041b074340mr5573618276.29.1720595309267;
        Wed, 10 Jul 2024 00:08:29 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e041a902531sm543655276.35.2024.07.10.00.08.28
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 00:08:28 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e03609bd52dso6027020276.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 10 Jul 2024 00:08:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVr8tax8Mme+bIi2/n1crm9dzpweenNuHA/aq1e569GaAWffkuCjAKJW9X8GH//cH2mu+VSwCQI31XXqsKz9A/VmZEh5+DKJwJwi+ItgBH8
X-Received: by 2002:a25:ac94:0:b0:e03:a70d:c12e with SMTP id
 3f1490d57ef6-e041b058688mr6130050276.15.1720595308046; Wed, 10 Jul 2024
 00:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240706075228.2350978-1-hch@lst.de> <20240706075228.2350978-3-hch@lst.de>
 <CAMuHMdV95g78=2GmLP95Kn3_0DL5zVuv2KCDYVsk8D2gNnu7SQ@mail.gmail.com> <20240710055203.GA25248@lst.de>
In-Reply-To: <20240710055203.GA25248@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Jul 2024 09:08:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3oSOLTth-UGjLi3SttqPf-6rG9DvUTLay=hVSySB3rA@mail.gmail.com>
Message-ID: <CAMuHMdU3oSOLTth-UGjLi3SttqPf-6rG9DvUTLay=hVSySB3rA@mail.gmail.com>
Subject: Re: [PATCH 2/2] block: pass a phys_addr_t to get_max_segment_size
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-m68k@lists.linux-m68k.org, 
	linux-block@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Wed, Jul 10, 2024 at 7:52=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
> the fix is queued up here:
>
> https://git.kernel.dk/cgit/linux-block/commit/?h=3Dfor-6.11/block&id=3D61=
353a63a22890f2c642232ae1ab4a2e02e6a27c

Thanks, that fixed the issue!

> and should be in linux-next.  And next time I need to do a full
> retest after doing your suggested patch order change :)

Always run git diff and git range-diff against the original after a rebase =
;-)

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
