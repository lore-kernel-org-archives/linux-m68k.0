Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23181FFC41
	for <linux-m68k@lists.linux-m68k.org>; Sun,  6 Jul 2025 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751797673; cv=none; b=B3DXLLyIwGI74SItmcO7dm97ep76Bwvg4clirdL62/dp4F/52vj/K3m2xONUC/TV6kmv+zR2CJsEm4EC4Oa+bbh1iTGLsjLFO6nedsn/EoW313k1WwJIwHeWbaC4VY+Ss27EYoscamN8+5I0GbBOt/Om4cighV9wvTt+2RPO8QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751797673; c=relaxed/simple;
	bh=2g8kSUiIHpNjcwDQNc+mUbHkCFwrkEz6nPjIdcGB60w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rlyWLCNDJUzx3S99961k/1E3t183MqS0BpK4VHAPDOcAGbxfFjaXoYn6LyBepUSuv7WnyfAxNR9B0SxlsrHNfeKQX/kl2zKiCErUnlx6P25DmlNi3+IdFOG980/GDW965Gt4nRjvYunOrBb5b3xQ/9KvSEa8+SghMQTqvjE60yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5314d78e74fso666781e0c.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 03:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751797670; x=1752402470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLgEzvYGm6L4rmt4C8LTf98kXe3XnNFl/EVyq0r1SVI=;
        b=pRCpJ5pC7NZBKBmToNx2imHekj5BqLcjgedudvtItzv/VbXT62fQPSRw9mi+waBlyq
         vZ/jIIhq3kVWGTcwP6bZlwYs0pG9uIHdXtz1UO4LNKQ5nc1IK6PtkWOkY7FU5Zc3+OgG
         Oq4wq8SHO3n6HJyPchPRcxhgEzrL7/F8wj0sy1EfV4JIgRuHjWazl/nG32b1bwdGLlhC
         qFR4nm8rzyeef5B0llgc0ScN5eiodxstuM7b4wY0EO3gJUglC+/N+JWWuUXnC25+8kwm
         ge6h9D4fOiEpJavDVVEmY2dsEt9QnJv2Q9OReHyluHevTzyrvpRRlrsHyrZf1rj7kA6N
         dUQA==
X-Gm-Message-State: AOJu0YwExrXM0NUmKKeyVZ9LMLuf3/pIFYLLK1f65FuzxJpdkGKHoSn4
	0ysN3e36ehQtEq783x0Er/eWAKy6rbryaGr6xbHgqnlxMXOMlaAvmVmtdWZ5CPvs
X-Gm-Gg: ASbGncv8tttjjX4Jriew+rGb1tojisLb2Bsw2GkgvzMO3UaL2aXcIRL4o3/z+aUwL1J
	xIts8VXctiwNY4xYZeuIire/YARIwRBDJNWjF7bDzOF+5jab9U3Vhg4+hk/0E1II5zDNpQqnQUJ
	pEKCaN0SB1Z1yaQ+bBZL8RXYR/8bvh5d3UXKIztV4vfj0iywbo3dy8hGFqv3nAh2VQE59mZ81YW
	dbrHHTnUFr4GhcvU87C+F2ZQryk5gkAJpn3i/u3gTAdlvo2oMFNfCDVvmk1x4jpVioCzHR7U5wY
	BiU9n9Nyzf8fEtaHMy3U8jV2M0NkO/sOrbHHk1odj6eJt6TJ1B5opxW0Guoh7zpYSY0cASU82bi
	h354QEjxw59ju//pP+Qi3XlEK2t8O
X-Google-Smtp-Source: AGHT+IGTDR90P/8kJTAN+grpa6kgDlfh+Y9BFOU5IQGG0u8+0tyyhw+tw6cbcBGSGP9+/GkUIO29Jg==
X-Received: by 2002:a05:6122:1d4f:b0:531:2afc:4628 with SMTP id 71dfb90a1353d-5347e3c2d12mr5373589e0c.2.1751797669781;
        Sun, 06 Jul 2025 03:27:49 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5347909e054sm887431e0c.36.2025.07.06.03.27.49
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 03:27:49 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-531b4407cfbso681256e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 06 Jul 2025 03:27:49 -0700 (PDT)
X-Received: by 2002:a67:e7c7:0:b0:4bc:82f:b4e0 with SMTP id
 ada2fe7eead31-4f2f24090bbmr4565683137.22.1751797669139; Sun, 06 Jul 2025
 03:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743115195.git.fthain@linux-m68k.org> <a6104f41918bed4fd17f92c45df94ac7a5d30e40.1743115195.git.fthain@linux-m68k.org>
In-Reply-To: <a6104f41918bed4fd17f92c45df94ac7a5d30e40.1743115195.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 12:27:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdbLz=x_ocZUuPisoYkpUB20VH7+1K5tAdVDcAhGvZyQ@mail.gmail.com>
X-Gm-Features: Ac12FXxnUkuRS3r_XQ2wOa10mggRqlBnJa5FwZOMGjdf7Fcg2tbUiUvcabTIQME
Message-ID: <CAMuHMdXdbLz=x_ocZUuPisoYkpUB20VH7+1K5tAdVDcAhGvZyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] m68k: Avoid pointless recursion in debug console rendering
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 23:44, Finn Thain <fthain@linux-m68k.org> wrote:
> The recursive call to console_putc to effect a carriage return is
> needlessly slow and complicated. Instead, just clear the column counter
> directly. Setup %a0 earlier to avoid a repeated comparison.
>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
