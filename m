Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8934B548E1
	for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Aug 2024 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724657458; cv=none; b=ZtE9maMnaRm2Lz9AGqYctvoUhPv77KJ0WcAVAECdy+EaViJxvAdHya7nK2Al3vwu8Rnxve6oAlcHQQ4DwgEsmEsFIXEnQMknCu2FzL1bwBUdONFn2StYf2hgPILNDaDFj2TXZoR6t0tzHmoahEvPjsZnZrnwDne01QIxyyO1cBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724657458; c=relaxed/simple;
	bh=CX/j63UgkM15rLGMJ0MEpUE6c01kEYDRQQNx5pWSrmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uRCAJVBsQ6BZurILdgWuW1zSeumda6TmBfIG887QKZF0Yapw9Edun19PKqLfMextwMrvimQDg+3bDSfm/wCh25vLbqs5sq5Q+BCPzNFCKoKl+MNEUDb5XNjGpdpsSnTWRqRc7NONf1/QjYSNLd5jSBAm0U9WqYbXjKTzEIPHvB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6b5b65b1b9fso32858197b3.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Aug 2024 00:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724657454; x=1725262254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ej0Y88/f1FavQ2R0a1yf4wgWu7EXeTD+zQk15WdLEY8=;
        b=iSp6D+J+EIIphfJ6YRiTMFmV17WH+z8mndiJfGJxuJTldwc49du4BdnzV9TK1tG930
         DSneybmWPHn1rqAd9GaCwjUikD1eFqri9AIkOG8IOmIFPmcZcBWJy3ndUfH5ThQoliYE
         xV4l7kfl3t10ERlAY53/bRPlP38m5bp0OHTKbUnrT2B7jjGAHYCeqU+0MF/4PT8V24ZY
         PhGoNXT9pvAFRRKGuVHEixwhPzU3Zy1MOUdxEzxBqy3UssdDJf0/OfUJ9AmOt/oOogiT
         qjrZlc+SwV0KMU7KHxfFqtJjkCCwMymxYOS/yHuE4seEApynFXahOLB29Hc7sp5bloaK
         oH5g==
X-Gm-Message-State: AOJu0YwgJitTeFjQG4vhqL0rPSh0zL7kgCNnfUZVO/V++5f8XGRdbRUq
	cR+8csFKBw0wabAp4RKgdMrbBoN7gecLu0iq4/5bKhzyu9cSGsjCzFTf4Oze
X-Google-Smtp-Source: AGHT+IH+hJAabE25l7VqILyvwduSUb98ZwS3NQe2TzRGAVNwV/JWNDjtzw4NA1f4R4zgvwefknt1aQ==
X-Received: by 2002:a05:690c:887:b0:652:e90f:cd15 with SMTP id 00721157ae682-6c62601404amr110781937b3.25.1724657453701;
        Mon, 26 Aug 2024 00:30:53 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39a753aa0sm14421747b3.47.2024.08.26.00.30.53
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 00:30:53 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b747f2e2b7so37070337b3.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 26 Aug 2024 00:30:53 -0700 (PDT)
X-Received: by 2002:a05:690c:660f:b0:673:b39a:92f0 with SMTP id
 00721157ae682-6c624bd7e33mr108695887b3.11.1724657453347; Mon, 26 Aug 2024
 00:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730234506.492743-2-thorsten.blum@toblux.com>
In-Reply-To: <20240730234506.492743-2-thorsten.blum@toblux.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 09:30:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVP+tpOEKo61EEd0Ynk=efaWRxoXDzSiWQo7YVe=W74iQ@mail.gmail.com>
Message-ID: <CAMuHMdVP+tpOEKo61EEd0Ynk=efaWRxoXDzSiWQo7YVe=W74iQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] m68k: cmpxchg: Use swap() to improve code
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 1:46=E2=80=AFAM Thorsten Blum <thorsten.blum@toblux=
.com> wrote:
> Remove the local variable tmp and use the swap() macro instead.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.12.

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
