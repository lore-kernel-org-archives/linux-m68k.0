Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CCD1F5847
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Jul 2025 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751793938; cv=none; b=bc7azFO6iH1IO9NAioJvMd5HqZjRlQfQGcstIcZuaX+SzO4NFx3nhz7F31rUBy1hVRGOR2XBFWXZFy8rjGUWVJbg/iIhtvd0cD8KQFv9Gl4AugXnKEGY6/4Olk1JIMT+kUYs/R/4zcHtQLIH4cYVHmbE1FlY9AJjoj/mIX6b0y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751793938; c=relaxed/simple;
	bh=MxO0CJB/LeaRXDyKaIun3lQmVH/9wclT5c9vNEFxP7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6D2JkxijkpMV+LS8kzk2YQvM32j5PbK2uxu6ExA3u8OGBB/Mg0oF2qy14lHtSUam6Yf2LvLUJmM2jEVBhlySPnqfM4ykO8sCGAtFGfISgrXS/qKjKZblexcum7N4wGdbfG7Qo645N+vbSMKYIMxm4tBnXPwno175jWz/8H6yh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87f2adec2b7so657030241.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 02:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751793934; x=1752398734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5jxKlcTKhw58OTPT2j6i8pivLSTrpiuZ++DW2VQfLM=;
        b=QMBeJroBXiRgeXa+ys/YNrbvpMAwqZV+aV6l49EVnhvjXthOY1+Dq6j71ayS331VQw
         b8I21NmQKMgdiVJxTE8xxxCn5Ck6fEgnKF6zzWbwrTEqiRtPzIKILKKgSdS/I3Lgun4d
         s6UZtnE9fuEyRMzmwVF/OkTeS5OlfXZyHqVCHvmiiqdqPmeU82fhSQx+tOgozLHh1n4M
         Jmht8tDKUdfYuSmvOfyY8KnLxW6MOZ+ZPE7ndeKQSg7z2S+FA5bOXFMSTeGBTAmQxAly
         0y8+dmCGwr4gn7AzWjPIvFWc+UVbP+BnBg+OfG0YKQ0VeF1SuXN4LqVMDwa1/wCMmeUJ
         tTNg==
X-Forwarded-Encrypted: i=1; AJvYcCWNt/4KuvlrkR+TLjiQ5rQwGxS6C5+uQYU5Gtg5hyONp9N3nlUFBn4T19/8enUYnogeCrXt1CvJ3Rf5@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yycxt/3BOTeDM+RJXA5B49CC/rT2Z1A9N6K90ty4/C92jWUKb9B
	Ea538wC8jojaWW/QZZHQ8e+wCN4nZhCbVziK9VQ6FDUcd7YNOslCDG55IZqmSrju
X-Gm-Gg: ASbGncvEHXXxTHC445pyXjEBtq5zy0Rbt3g47EiLhQL6sw0attwH52jKsgrFmIipKWp
	YW7ra7nYANwAmzAVu45fyj6IYJJAf1C5mH02dYUTLxq7r5suto172QXXVZMRRzUAcYFdq5/DwPO
	OV/+uVvS/eP3TLeBjBRgppTNE7vzI4wSpfwSpmUlzoasLgte22luCuZxwKOuMpdbyzvKZxUPtPq
	Y28KtErfF7T1vwdstUR7rSRa/Ev0DtWRNBKUyZcdXVDajWETDq8VjAdT7Q7GxT0M/sxTEJY+bKS
	7M9wFhRoLu+UYDhanGtn+08HTkoDoBazs/AQBAtDLhBAT/fIzhWBrMv2sW+OtraU2M325Bm6n/p
	Fe9EADborRtSPlYgJQr0RRU0vVuhL
X-Google-Smtp-Source: AGHT+IFfwxZcbzZNSB9Lv2oPRgpRlrVYaEJuOuTH2VMh/tWdE1N8aTvfqDtv9ZyVsDutcwatu0aE+w==
X-Received: by 2002:a05:6102:26d1:b0:4e6:d7af:a7b1 with SMTP id ada2fe7eead31-4f2f1e16fa5mr4522793137.10.1751793934511;
        Sun, 06 Jul 2025 02:25:34 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f2ea6fd684sm801006137.25.2025.07.06.02.25.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 02:25:34 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-52d9a275c27so2266792e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 02:25:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6OcmhD4vZJ66c7WLEmo0gotqWjdYg3lgmKfR8eQE2+385C/Kt1T8+ClCD5Mphu84VFJnTqzg1ZHOD@lists.linux-m68k.org
X-Received: by 2002:a05:6102:418e:b0:4e7:866c:5cd2 with SMTP id
 ada2fe7eead31-4f2f1dc3efdmr5390786137.2.1751793933819; Sun, 06 Jul 2025
 02:25:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701135616.29630-1-Dave.Martin@arm.com> <20250701135616.29630-11-Dave.Martin@arm.com>
In-Reply-To: <20250701135616.29630-11-Dave.Martin@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 11:25:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwN7iMvMeC66SFD19s-xX6d=hDYZpvzBqEXSZ4_fPuuQ@mail.gmail.com>
X-Gm-Features: Ac12FXx8rr-AkaT3Va6DYyUOrBAjxujr4T9dfZ7LaO7cngz7jEDBpCtRAxW4jnI
Message-ID: <CAMuHMdWwN7iMvMeC66SFD19s-xX6d=hDYZpvzBqEXSZ4_fPuuQ@mail.gmail.com>
Subject: Re: [PATCH 10/23] m68k: ptrace: Use USER_REGSET_NOTE_TYPE() to
 specify regset note names
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, 
	Kees Cook <kees@kernel.org>, Akihiko Odaki <akihiko.odaki@daynix.com>, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Jul 2025 at 15:56, Dave Martin <Dave.Martin@arm.com> wrote:
> Instead of having the core code guess the note name for each regset,
> use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.
>
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
