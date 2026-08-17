Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C7F3BA235
	for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786956666; cv=none; b=WiE78Y69Pwpc2cLSn2nsrC/a09tBj2l/viIESfugjMktNUBrG+FVMvxPNP14SM1O0icMAfSI+EY0yeMw12PP5ZXQK7gFflnMt/nVzRxumONlAIobI6TzU2xjyQ8sRy7hpqNIqrCzfn6zIMCSTKtmpZAe2/uWosGy6Tgr9B0yibo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786956666; c=relaxed/simple;
	bh=oIQkD2dfUzBuDRWWMkSP5p49Gr07cGfqKwxWsP0BCd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMhbNVqGGK53K/EpdFnXW+ZhBGoHb/MOdxQ04nA5pnC5vU5XE+W9G2jY2ayyA60ywbg9uJqx5jAgsozlmsuWX4xMSuflVuWV8QxpJfSy2wnwRzvoXFfdT1mCq35YqyhaWSVIkIypkykiySvIXaH0LETKn5VFYEvqTqh72uLYHXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97bf8775803so1918185241.0
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 01:51:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956663; x=1787561463;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3FI4ZGpZLzWpq6noUTbY+pmsayJtO9ydjcgco8UjiuQ=;
        b=f7LPmk93RcmtbNCKD8vXu6Sm8WcJG7Nxmc+CILLmMrl7SCzDJhKd5Nx9fCOcMa4Txr
         5PViwFsHw86geHt2rvYQLLlyCs4Q8Ee6vqMcThhXoAdmIAHJ+bR1ertOYZBNXuE5hsmn
         JH/4oQvB9b/uTK9BFMoEbhnDjx59FL5T6eUciqKAZgIJIoMlSnOgugCGi9fEZDGUx/tc
         hfIwPgK3c33wim/+sH5YrH9kgs1v6eu2jxJeDBaZy2xo6H/126332TxfUlx2NXh3jGlz
         LTaqMg2rBhNWPsmRkhnc72dvIKXvbxjlNWZtm1TvhqkuWuRYQEGYptJ5MEdW4j1/4qJi
         GK8Q==
X-Gm-Message-State: AOJu0Yx+tjEbqeRKPszQvQ+GjAdWMELUHs18tksO+JZrkn9IZXtT4XSh
	nLG/UjhzOBQA9k3tgV+E2N/4Z4YOPDJMoD/UIMdkOO05cRmZIr31vwMvnaN9+Z0J
X-Gm-Gg: AR+sD13TsNMJKYFuWxRDhXelEm4WLh4P0E/qCa7TNJCECFHjveZIC90YjlPfRJJHB3F
	uTB/2JKkmCaUr40q6+auMSnhlpLp7TbRWgmpQLAvM4rVzvD/zj+zEvPU13LMsh5jJOY94VDHmIB
	JX01/qJ5SUZeb9TY7KJQ7plupRTh0UV+5WnKYNuKkCT3zLGo3u4z4/s89MU1VHqUa+vId7s3Gcz
	cpUgj4z2cKDsZFmH7BMxDGrWPFqTC0luOGmABGlJC2S4ZHLUIyTDGuqyBIgUlKVYYBq/no43ZY+
	AZC4Y2tyHlu+V0WCtGKtfHfJ6N3njlh5St8YTpHDQ3fL/gnvad0xGGeAtbRFftR3VvhamAk9qWu
	d4yIG2jqF0ESqo9tsMRKd5GwpwMWXHO+RcDemuedvhVDctfm9WboRsOK268LoXivxP8g6AJzhL9
	qokSsyo5LLywPxFqiFe/4SmaHXp6KpAzYfq/mRa1B7j4jHBlL8dtGqo0je9ihia5qKC1RFnCqkt
	FTnhvC6ddSsL+FE19oBpQCXz7zvgOiEdmmFeGLq
X-Received: by 2002:a05:6102:3943:b0:760:330:312f with SMTP id ada2fe7eead31-76dd3bc43d6mr2626126137.15.1786956663484;
        Mon, 17 Aug 2026 01:51:03 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c2cf06a6sm443208137.2.2026.08.17.01.51.02
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:51:02 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c39cb2115cso2999878e0c.1
        for <linux-m68k@vger.kernel.org>; Mon, 17 Aug 2026 01:51:02 -0700 (PDT)
X-Received: by 2002:a67:fe48:0:b0:773:2805:4ad1 with SMTP id
 ada2fe7eead31-773280569abmr400286137.11.1786956662527; Mon, 17 Aug 2026
 01:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816073752.16656-1-schmitzmic@gmail.com> <20260816073752.16656-6-schmitzmic@gmail.com>
 <CAMuHMdWKqtNd1iGNsXcF6NUQjF6bZPp8YMPWB3y7++2VpwZd-w@mail.gmail.com>
In-Reply-To: <CAMuHMdWKqtNd1iGNsXcF6NUQjF6bZPp8YMPWB3y7++2VpwZd-w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Aug 2026 10:50:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCAtp6yRsHuUnALm=Fak8xAqHhCOfH-99emF7hDDzxVA@mail.gmail.com>
X-Gm-Features: AcwNN1XjoxAVeb02ZPzBJcRTKdBtRoe8ONHtXOudx_5magW1rtprmqm3xU_N6Es
Message-ID: <CAMuHMdXCAtp6yRsHuUnALm=Fak8xAqHhCOfH-99emF7hDDzxVA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] m68k: Add support for Svethlana
To: Miro Kropacek <miro.kropacek@gmail.com>
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 09:14, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, 16 Aug 2026 at 09:38, Michael Schmitz <schmitzmic@gmail.com> wrote:
> > From: Miro Kropacek <miro.kropacek@gmail.com>
> >
> > The SuperVidel FPGA contains an OpenCore ethernet package. Add
> > platform device data and other necessary definitions to support
> > this device on Atari.
> >
> > The ethoc module must be enabled separately by the user.
>
> ETHOC selects MII and PHYLIB. Do you need to enable any MDIO or PHY
> drivers?  I don't have the hardware, just asking for {atari,multi}_defconfig.

FTR, this increases kernel size by ca. 52 KiB.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
