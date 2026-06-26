Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AED6376BCD
	for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486466; cv=pass; b=U2Ua1KY8eAQXvDPOj9hcqVUIQVY0ltDZ/DI3K2wVsr8pMloy7Zr6yA9HyVAkbzeax5ZhiPTMYFR+9RWO85Hr6jiejag8OYU+6CQmycjeaUX+h3pk82TDvA9Yq/DxC5VnGjWLaLWa5oAdYCT+NXQTfppJSxBUYKNYruQtWnF4liI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486466; c=relaxed/simple;
	bh=GcyqvEqFw1BzEBuRv+LFbDDtDaE0O8S8UmZATI3CH/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbhnKyClhadZCKsYI8dzECl04c4A8g05Rtlc/L9epel4Rof+MuxO/ZBSvnTweYFHs1CLIR48lRLeb0ykIFIyAqPGLF5Pu+YCs8Hfr291aDJgWCDIh6JpmNX+ODIJ8SCvt/dAKxmfT4ypCXOFUsGVEiy6lDAiruhzOUIkPA9qJA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=kNjsHuni; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="kNjsHuni"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-139aff562e1so1608265c88.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 26 Jun 2026 08:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782486463; cv=none;
        d=google.com; s=arc-20260327;
        b=sMk0Nowy1XcnecSi8uGKPMniwUYHvI/7mu/i1NfC4a2joJINeFxUOD1+sQunnEZfHE
         IYNX4JE7wJYU1lwN6ct24dShaDbgLIxtPOiIwKWT8CumzhVY4AuV8X0ruJeDavTdF0vQ
         5NIgc08GBNj59xPbqtVppg6qAOkxOZMSsi6sHRN9+gVzgDMKEWUWTuJv2sjeQuIZnzfu
         Clg6dErioyMfN2liFAU2taH2L8/OirsGZ0IRpngtGm4FGVgNbPrmpY90Ypk6RfJ9w+OE
         BE6DF0466FnwwUrtZO2Qf0AbxPSGhfM8TSu1G58Y0Odq2qdWkPFEkZ7b8BxgnKgMUJjX
         WrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GcyqvEqFw1BzEBuRv+LFbDDtDaE0O8S8UmZATI3CH/w=;
        fh=7XoJx2jz5Jv0Z5yV+YHvH1TlVfYEoEOVUkXIqfFfdJo=;
        b=gN1qYsY2oW96cn/yAAeVzAI6ACFyXnkRUFJmUPifKmyDLNVLO1k0YUiw/7Qw0P/3uN
         MwwREdMw3YFEqLC6N90By4HT9MMifldCShXk91G2o8IXwNbCaAgo5OlodY74Qrj+GWSM
         nGevb9f1dtJDaisXOd7cZJQJO20hgJF1YyyVe3EevXSCYpo6N57VvAD/eQPU5FCO8Bv2
         ENpeIXDAb4GRfk61fOeRt20/TyYZOzUQK/B0czmSBN+nvvKE+LWhbLEit65Rp3xxGxWm
         A2vkg5QSMS8ppNnP3jAf/7o489k84tiplRhuAh9p24y2RCLfTRCwEcJ/qd3xVLEOw3rM
         F8+A==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1782486463; x=1783091263; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GcyqvEqFw1BzEBuRv+LFbDDtDaE0O8S8UmZATI3CH/w=;
        b=kNjsHunigxaMXQfww4mb/6xA2hCSxxLGbzG1XA+0tMdBMjwz7LIZmYp+BlKzGolpYB
         +UHLagoRR2T0RdaaNj4DXKUeZ4H6NQJoHjsyRKxj9sKutzr1OXxDB9bjCKu1p11rvzVb
         kHzA1I8a2olDW3jhFeJe235PJaNYJ5d32JIT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486463; x=1783091263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcyqvEqFw1BzEBuRv+LFbDDtDaE0O8S8UmZATI3CH/w=;
        b=f959JSBznRCYdOA80jGe7n3iSrBBn95ICI+Io8SdgwNHTwBqlp4ThwA6zCH0lfgUHD
         Mxlv5zN20qHFGv5vS9A17R2GPHBcq7fVY0U87keFYnHROLK2G7+sp32smhhi74VGRKuc
         D5EEQIghq31L9LnzJUbmbJpgrrFc1qRVZnHnHFXCxo0TuFQjxW9XAOlXOUUAj4whjgg2
         tY3/2FJkSzn/5SDzGtKaG2rUCWF11wMn4HhJUKSkd+AmHdJ2bs3apkZGNa9kW7lBnhNg
         Z3pi7jwTaReS0WSSR2HD9WkIYU9usY/ewD0WSTuImTMOFi38z0+h0Tid+5jZELhGDcH3
         99zQ==
X-Forwarded-Encrypted: i=1; AFNElJ+H3PoZTF/3Ln35UG4k6J/5eDlKrWxrVwEZa5TZV7PjjQ9qwWU7HIhOnf68l8p4CO1PgcI5LvQiOjpv@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxGi3PABt2fsAQiFDw4/DyrViWHAtme5gWbgLjl6e4hN2Vl0+gy
	G2dWAas74JoyOlQvx4SQFrMCGXJqh48e8soQl5iwFHZqJJcsBHEvepIHp3CiW5rE5/m+se16jTy
	JSnH1Scz99wizgrxHiJkuUNxTR13e0n7tKWN/dXsNZg==
X-Gm-Gg: AfdE7cmAUXKcT1NzCcwS3XOUW+Inn81bctJV2d1fcnuqbJ7hx7L9VVH34uSs4G6Q/lK
	Aorcz2OxoKweg9IKpek3PrSXJQnp2XxzPeS/DrwpscOq863S7cuIENzi80s5/yOWzGA0m9dx8X/
	HuwXMoIvv+Y9jK2C46r7sdLZWJ8uAHeWdIGRHh9p/gm7hokOmg19L5shSpDZMiZH8R9UNuEUfE1
	4oL9Iq2cHuxdubqnoJJLUZCKfq49nASzLdtlCM4I2D4lMV2TFtJxDgxR9im7sw3SYjHc8Ba
X-Received: by 2002:a05:7022:6098:b0:128:d20a:2f40 with SMTP id
 a92af1059eb24-139db9e831fmr5798908c88.8.1782486463137; Fri, 26 Jun 2026
 08:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626145731.64010-2-thorsten.blum@linux.dev>
In-Reply-To: <20260626145731.64010-2-thorsten.blum@linux.dev>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 27 Jun 2026 00:07:30 +0900
X-Gm-Features: AVVi8CeY67nKlNahBwoCc9y2KSru4vGPAtmGNmV8pGLetkxp8EEX3GbS19Z0aIo
Message-ID: <CAFr9PXn8b8ZUk_OFLTum6Q_a19XNRwu61usgda61jfxMVvZqYQ@mail.gmail.com>
Subject: Re: [PATCH v2] m68k: amiga: Mark amiga_reset() as __noreturn
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Fri, 26 Jun 2026 at 23:58, Thorsten Blum <thorsten.blum@linux.dev> wrote:
>
> Mark both the forward declaration and the function definition as
> __noreturn, and remove the redundant redeclaration.
<snip>

Boot tested on my A4000, rebooting still works. So FWIW:

Tested-by: Daniel Palmer <daniel@thingy.jp>
