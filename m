Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68112EA752
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Sep 2025 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757326058; cv=none; b=IE4ICi4XZM7VVKHAQ7nXsBmTIsB8WIvGPbJaLqSZvTYxU/iswbNotEeZP8cAiV0wjrPuB1Q5KqvHGL9Lam4BdXJ4ChK4TV9QAQ/6hr8HHvm/MSOrCTyLdp6YSlVse9SZVBo+DkWx99ihlMq9Hq7HCq2EvitLn34IqZ0MINL+TFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757326058; c=relaxed/simple;
	bh=hZDQx+oaY1alvKhhCifEaFblb8FketN8vRtcuRulYI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9TkDi2EzstwRS3f/ZqpoizX94x2gYL+q7AErbTPWjpimpJScO/c4tjPmftFnqTGBfmpIdy2KO4rqk6ydyWGkulQaeskcC2qYSiBYEAOyaSm6oEBGvyA2+giRsVlvzhNvb6EjR4ouoJhUZdLR7JmCCj+IYolqHh/0b/Mx+594ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-544acb1f41dso1833624e0c.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Sep 2025 03:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757326055; x=1757930855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsI2GAvj4+x78jlqCOLVXcSz741txA1wpOaZ/CN3KVc=;
        b=ntHfIvDyYeUpoHd/cfNs2g4nJrEi23h9AA8ku2JDAeoNLtJSfNBhz/xDAboOSpu5FD
         30Y41SgYZ2ZLlVyITkYZopdxM2NnZlb3x2Dt7ckBjlS5H9qyzGWq59A6b2mGwcDpXsN/
         m5MEJUCDQs3uVfx30p3jXbWLUCjweGWRn+IGrnLormv/O6baqGZRKqv6otsW3Sq9BQWM
         MTuFpYTZ3R0Nh65aIL4kPOWAISEr4aa4rK0dxwjlsbh/OaTOXE8G9zRgai1gEilARF2R
         g946tlrG/jsdW8g66X2xQHEJb5p5wTbijjJx5sQcB0ZKct7OAX7mlDXOLM4jNFOzZyVK
         +VMA==
X-Gm-Message-State: AOJu0Yw1nUM/GfjqGLFVaC2oQHbTqJiXS2FUXD7a8f6dByASwD9/T8eG
	oBBd6kX+b7EPA+cQ++rFCcOWooQSzBilzTNsxfnoR25q+cFQejp+DF5jdBJMSADh
X-Gm-Gg: ASbGncvikRCrrYMQOlrKKN0tmeAj1UtMDGAWn71l0KZUzRQ3mP/vZ3B8hXV3BBJhG8z
	XOdkx1CDYGOdprgqLtPw7Nix6wrahRQ3QU/Zn+JpVtLf7Bus3OTzsFN+5SRNJeEjqaDqUcqOLLI
	eVDDoqHsTtPTK4/Io0TUY0PrnTo2siNeZusYAjePoFmTddyXLohjvi4Zt+tfRb4ycPJvZ6f2K5Y
	eVIHEwCE3etRysUKr/nAC6lLh4jiCh+l4YhKWD+bwO3IqyhQ5HSDQxJzn9RLiP/HSjyBJq83yZt
	BaSnUi9WuutG5TQpn86eAchlu04qyqb2Oo3AWHvcrOgE59jg26xSSjY5hOcOgPnYDFM0v0uN3N2
	ELfMEBz4Vdj721g5pWDKpBCFZgD+pJjzMY/waViXPZOWxOhlpgPvq52sM8O0T
X-Google-Smtp-Source: AGHT+IGPW2Ly8gKJqlvJvcZG0ODaNJox2zcwzSgbK8UWhoSAf3OIOD9oK0PTQX+3COwsM1S2oOc9+w==
X-Received: by 2002:a05:6122:6599:b0:544:9414:105f with SMTP id 71dfb90a1353d-5473a3c5cb4mr1601513e0c.2.1757326055100;
        Mon, 08 Sep 2025 03:07:35 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-898364cdf79sm7179215241.1.2025.09.08.03.07.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 03:07:34 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-52a80b778e7so1229108137.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Sep 2025 03:07:34 -0700 (PDT)
X-Received: by 2002:a05:6102:54a9:b0:521:760c:7aa8 with SMTP id
 ada2fe7eead31-53d14d8c892mr1786574137.27.1757326054252; Mon, 08 Sep 2025
 03:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1757323858.git.geert@linux-m68k.org>
In-Reply-To: <cover.1757323858.git.geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Sep 2025 12:07:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxT8kjdkEef1VeGEpJjQg249dNQOf_k4ZuZ2O4PJRELA@mail.gmail.com>
X-Gm-Features: AS18NWCSMWBsHIiOtA2g6I0sYdLIzfwc7QSwuWHE8Taxbo1FbOvJViPzbgqr2jI
Message-ID: <CAMuHMdXxT8kjdkEef1VeGEpJjQg249dNQOf_k4ZuZ2O4PJRELA@mail.gmail.com>
Subject: Re: [PATCH 0/2] tty: serial: 8250: Rework HP300 serial Kconfig logic
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Philip Blundell <philb@gnu.org>, Kars de Jong <jongk@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 11:45, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> The HP300 serial driver has a long-standing configuration issue: when
> SERIAL_8250 and HP300 are enabled, but none of HPDCA and HPAPCI is
> built-in:
>
>     drivers/tty/serial/8250/8250_hp300.c:24:2: warning: #warning CONFIG_SERIAL_8250 defined but neither CONFIG_HPDCA nor CONFIG_HPAPCI defined, are you sure? [-Wcpp]
>        24 | #warning CONFIG_SERIAL_8250 defined but neither CONFIG_HPDCA nor CONFIG_HPAPCI defined, are you sure?
>           |  ^~~~~~~
>
> This series fixes this by reworking the Kconfig logic to make invalid
> configurations impossible, after moving the HP300 serial suboptions to
> where they really belong.  It is meant as a replacement for "[PATCH]
> m68k: make HPDCA and HPAPCI bools" [1], and was compile-tested only.
>
> Anyone who can test this one real hardware?
> Probably we should add the following to hp300_defconfig:

Scrap it, this doesn't work for the modular case, due to the #ifdefs
in the driver, which should be converted to #if IS_REACHABLE()...

Sorry for the noise...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
