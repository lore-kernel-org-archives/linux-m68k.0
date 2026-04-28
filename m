Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8512128B4E2
	for <linux-m68k@lists.linux-m68k.org>; Tue, 28 Apr 2026 06:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359529; cv=none; b=XZO1QNPBwT/jk0geCejfFtRrwhzubMtfntbZ2QL5mjELf4fwJ7HtnBmxvsvz7V1wIeGvbsOjsXD0GmVG4Lk2KRJknxcRkR+y6XLi+pYIPJFI/Sh4kSkjU0s8Afn8bQXJdOJUkLUR1BCzobeGN8nIYtNQs92AiyIj+S3uk1Gc8wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359529; c=relaxed/simple;
	bh=Ke8bRUdqBfahDaxMnO0T+9k2veTih85VQpLRCZqciuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPwP4l/9HcrBDE1bEO8ZPkfE54rvXSVV6tsTSyWwg4mEDmk145hrYFGkXDHzRDt4RM5IxzFcfQp+554Pdd0hD9KA2d0zwYtDis5i1IbYrqr0nQR/bkuE0N0oKmtXCF5OmsASdv0wurijWJsffBNjusMCo2+ChmhxSMSFcfndNKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso10588215e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 23:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777359525; x=1777964325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PF3j+sY6VDn/b3XG1Y7Z+9M+AzE58WOK8UHU23nNvI=;
        b=faZraRw2gZr/0cOeg+DaRA2yOzile7FmaeaOQ/7uBaeFfmOg8D8pBxMRT3q/7SqFbj
         KbwKJZQqmbJuxfkMq3NeWymD7othfRAC1Lo6UYSnIEdgAgNnrsbcow+jjFiA1P1W18Jx
         Z22Tw5QBa6bs/TdtG7niysQtmMhqIDsOvXxzi+OZZzpLNeJOBBlLR6z49/28f8yckd3d
         onpm+Z5UvODvBDs7b+Q6NIuUiVOI+XoG0HCLuBR9RvfksbFWYoRkM3bHyvxRs9vM+3oX
         7ZW8gU2bUDjbEnLMhWHyOx5kfoHAU1j9fkwR4Zbi3GEyYytI31zupCyM5RClDX9lTJ8W
         BrBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Hycm/pRVkXRfckvNaZCzVOiK294EYu/WjSYZczzkUaBUyF/zuMrkp3GmC1/A6koAgrMBnTgV9f4rX@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy2+ZBezIH4eLaqErvMXSOHubjl43kzGtKCrRyVEtGHFOAVn/Mi
	2s6ipn5kSMcYkNg0suJ6qPBeKe3ubhYJOdBGGiKTCXB+Cg36hcbw38zfeyJENowGjLM=
X-Gm-Gg: AeBDiet+pzlUhoDheBXw0W/PamT8JOGLFip1H944e6MUN5Tm7ZH9ubguod0g2GK99CS
	oalliRDLTidUtP+e8vSwF1kvDVZJxfsmakNmEN3EF8U9aHhaMIQIWhgySEm9cbWGqSqHOaY3ErP
	fjEGbyfJFJax36K4Z9tBY1hKfakaGd+eedikW23t3wKX/IoN6v0W2Q+CD5XeXmzas8h3M8mgBOL
	cqwA3EpdEgkIO+xhl9WKaePG8oFSuVexPA3VukkZF648eL+tBye9U+Z0560m9G2FoMo8BiUn/L3
	bOfQjofmFFuRoRAwzJW5u46zWuQbWfFMkB8x8H/BFhNFXGoogZLUNMVVQiIob2etsIzdvkGB6aw
	ZdGG6P7Ry6aYtL1TIiyCsI064jjf5PyjLNzfcHq+VRuCp7/LLQjpdls2hj6TxPGtKn0di8MYmb+
	x/40APCHWM3K0ea6jNGErjD64w/HhgOmRKfQjWz8/a8Vy9WLwlArsKDDzhZ4mRLMur/OTGbWoYj
	16DcC5uDw==
X-Received: by 2002:a05:6122:288c:b0:56f:1bbb:83d6 with SMTP id 71dfb90a1353d-573a566e5f1mr804342e0c.10.1777359525223;
        Mon, 27 Apr 2026 23:58:45 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573a4630970sm1018201e0c.16.2026.04.27.23.58.45
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 23:58:45 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-628086439b6so342230137.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Apr 2026 23:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8uvz5khNzsb4DmBQhxdhXUSrhEyiiMz7wkRk0JReHgWpc6UmswHxIwkXOa5uiNOHa0HkwgZHavnds2@lists.linux-m68k.org
X-Received: by 2002:a05:6102:950:b0:607:7991:8edd with SMTP id
 ada2fe7eead31-6280a8c5705mr640942137.19.1777359524824; Mon, 27 Apr 2026
 23:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427105810.23761-1-pbonzini@redhat.com>
In-Reply-To: <20260427105810.23761-1-pbonzini@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Apr 2026 08:58:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvehWeTwdN1czjvv7OjGsu_XaaYS1R6Tg557mDqP+fSg@mail.gmail.com>
X-Gm-Features: AVHnY4IUbWltZt4Nuljx-hPEgpXnbRcqSixeYk6RCQC_1EScDCPPRIuQFIAQkWQ
Message-ID: <CAMuHMdUvehWeTwdN1czjvv7OjGsu_XaaYS1R6Tg557mDqP+fSg@mail.gmail.com>
Subject: Re: [PATCH] mm_types: remove references to s390 gmap
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-m68k@lists.linux-m68k.org, "David Hildenbrand (Arm)" <david@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 12:58, Paolo Bonzini <pbonzini@redhat.com> wrote:
> s390 does not anymore use special struct page for its shadow page tables.
> The honor of giving a special meaning to pt_index is now m68k's, so
> rename the fields and adjust them for the desired type.
>
> Cc: linux-mm@kvack.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: David Hildenbrand (Arm) <david@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

>  arch/m68k/mm/motorola.c  |  2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
