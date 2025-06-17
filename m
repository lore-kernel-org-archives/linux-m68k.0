Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CFE2DE21C
	for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Jun 2025 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163361; cv=none; b=irsZZI9heq+6N9SNRhTmvWF8d0G7yPN7kTk/CQCH0lGZIo7V/KHblWuAubpRfIZC3mvh2cO62+b/O8+ggQwtkkw2kLexEpW4YgC/ID7GkuS0RqVyFTdRR341STH5L7nhYab0jrS5OIiSPdiwnQBRRLCxdJazeEljeYiRSCOreCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163361; c=relaxed/simple;
	bh=1rabJWHs/troXwkLRRhetm/8+lxBBJBnQJuQDDtiXSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JogLE2WK8PFOFg/uPNADUV+wM6RcPcdTIGolUpC+W2CAv3IrJoRYXvIQwMJKI1AYWFAr9A9RvlkfdF9HFYXwUwXe/ps4OHSuYiIlYm5i5wiE+Dck5hzFoQxjyqiLnGSDwMsKAVcn3Q6nxVSth93N0wGRAosrq56cePDKmxJzEig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4c9cea30173so1546214137.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Jun 2025 05:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163357; x=1750768157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uly5rMibStMdldgH/XC+DdGvc/SzsbEOlkLd11yOicU=;
        b=X9/8xzpu7d0fA9SNpwe3oKMklBgXUJ7xmzl9YXukua7mx4dWvR1hG6GP+XFczI4d2e
         exgVAnXFqYkHzT8FEk5QPbFtraPxgImwbe3nx6ku/587F/Rl4WGZf+mmpwrzaKk9uDWc
         IgHC0MJUXgGIE0YjVTex9Jn5bE1gbMiqykNN63HBBoEs7JOKZBJ4dZlJaoE1+Xy7vfSu
         /Wh4Dn82QFkAmbBhvvK31064F2tEMbJU8pKu4GDf6Hnt6VsbJdhZ2XFrfhGSylthMRii
         QXGQ0BNMPTKdG+y9I0o14T9g8wG4obGoPVmiJHZMLYEaXDnPwuO9MdLp88FEgdB0lHdd
         +r9A==
X-Forwarded-Encrypted: i=1; AJvYcCV2sF91KOvCrEjr+7xb0K+Omydx0N59Qy4lwEG+A0ydd5nYs39SHUgQvhz/X4VCT9ukCggAxwz4SXAu@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwopnjEQJn2JxCBRkrzjFqp8H+ca0NopJo/+CuB8idRSpB7B3mm
	Cp9IFBf7nUZ7HZWEapCN3ez5kWU6kPRL83KQiDBmdl9xXlVbQ3KJR/OsKdgS0TKA
X-Gm-Gg: ASbGncv7Axr59H5bM6/ay6/qq7Bz5VcQju/d3pPnH8PyW4saEHK5WsuRmTj550F5VO7
	uNYqwaLiFPE10mv75qi9KjTbStc7NXQqxECMUmchI2B+kplAVVPvLd9XziiHK57VJLg7mgGL++n
	Ilqn2pOIou8wOVX9fklQmtbFIRnT3NFPS95+GiItik+jLYTRWKpekvUA4mPzzAOLRkcncaQsl7j
	aq4f1hAju0Qjyq121Fblo2PsKSRFkKcPFbUIFq9mM/kN3w3p7xQE0H7AKbb0lrZBsLrsjC3msyR
	/VOzPMokBbvtlHgLfo/WDQD5gYuftqLrfhDEATCn1ZONJj3tFJ+lHGPSv90qkSXUzCbQsQTtBj+
	6k7C5MPHKQjbYqMjbHzdpmRmG
X-Google-Smtp-Source: AGHT+IHQkIWessLHtmgm7brC5fxJu9kfMNicuQVq0KlDm/gPGUapsrwvmFfduCKevi2f1SCqgkvbWQ==
X-Received: by 2002:a05:6102:6a91:b0:4e5:59ce:471b with SMTP id ada2fe7eead31-4e7f63eacdbmr9315692137.23.1750163356579;
        Tue, 17 Jun 2025 05:29:16 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e6e18f37sm1725123137.7.2025.06.17.05.29.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 05:29:16 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4e8135adfccso654628137.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 17 Jun 2025 05:29:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCqf2Mm4fbGgfGLFr4I5wbotqzNxJ0x5eY5gF0T2oHsWGroovMCMA3j/rLM7V5CAa16rZXAVP8u6KC@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6c9:b0:4e5:9867:14fb with SMTP id
 ada2fe7eead31-4e7f63f3d52mr8675512137.24.1750163355790; Tue, 17 Jun 2025
 05:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611100319.186924-1-jirislaby@kernel.org> <20250611100319.186924-5-jirislaby@kernel.org>
In-Reply-To: <20250611100319.186924-5-jirislaby@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 14:29:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUDFjBwu-3+bx=MqNW_m5EdUHcfn-gROY1ZfHFahzkUgw@mail.gmail.com>
X-Gm-Features: Ac12FXy71I420HG6FoY8xytnP_y8sbWA9TF3YO8Rg8lKJ2-nqSvV06O0TmPz6vM
Message-ID: <CAMuHMdUDFjBwu-3+bx=MqNW_m5EdUHcfn-gROY1ZfHFahzkUgw@mail.gmail.com>
Subject: Re: [PATCH 04/33] m68k: remove unneeded tty includes
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joshua Thompson <funaho@jurai.org>, 
	linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 12:03, Jiri Slaby (SUSE) <jirislaby@kernel.org> wrote:
> All these includes must have been cut & pasted. The code does not use
> any tty or vt functionality at all.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>

Since GregKH seems to be eager to pick up this series:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
