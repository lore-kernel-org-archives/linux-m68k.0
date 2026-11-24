Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517312;
	b=rLHH+m5goeVsfHKUdqG5ah43eyfDo/IY24p9/2SKY9Lr74E9zNfQvwpaTZgLy3glBwzN
	 0qYWJqx0zn5EJUF0QSjM7kSA6iY+wzb/c1gy8jJ/A/E/wsVk1w8kudYPewOyzunmb+zw4
	 3erbV4DGBGNXOVDmOYnnztCs+9OihtFMDPrP+3SnmEySl0ZYi9ayWnsFaIsMkYteBScmq
	 pP2DxqAhv+h+3VvYk8V48GLzgM1AjwvJQ9d2/zK+Lv18/eqi07KAH20BFjAMCrErNWvet
	 YXtnd6uLgymz+UJ0ink4BzHhCutETRS1yOIj/+2SHM9CHFu4rD9hN9nXvT1MgETWhKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517312;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=sONtv6uuoQDqrzKy2E1x+FEJb1HP1UNQoeW1slamno4=;
	b=0L1fcFzLhJRUdfa2Djjzz5br2tLTnu0hVeK14aA6BFI2U1GpWFLOuM2Fqbpu0Oq97bt1
	 uPuoJMHs2IPDP5iWdelGYd31Y4FuP2zeuhTH9srvo6liZlCre4zCRQMbJrB5/Yeq9asjR
	 /+G/KOWm+W7xcGboxAGjghNh4W1KP78OnDW39fRdYOAHoewmPmbIEw+S93OBdwdjBpO0q
	 40vDWKgViTtd6pE2tmlSxUKaewZB+5w+7tfS3ZhfihgncEJCe+JOy4qdVPUWytSuzFhyv
	 rIwarXN3yF2SWW/9D4yphtRreh4cWTldfZ5u0bgb/QKv6CZBxxugVh9uMbMwbabKL5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA11606A326
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 10:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EA11606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99e0d9b3438so964101241.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 02:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517311; x=1796122111;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sONtv6uuoQDqrzKy2E1x+FEJb1HP1UNQoeW1slamno4=;
        b=wL//NqqDPvN0+AYoqwQGzhgJ3hVMDiTHh0u9qc825EA54Xp3MA+iLucHn1lR4/qSC8
         sZk6edbOtngaWFx7zPPQIN7ySo59v3SGlBh5IHVW/ibOdsr1QHpLLrnYNyN73JSS765s
         hvJqvq/iBEO4JiY5lcGdhuiuqwRkR7SA6oyjLruMU3SefSgN3ECuoIMYNW9bTqPKY39q
         3zkcXyimgnTx5L+7kUxKQFMF7Wgr0Lq94wXCQ5hoIxKXFk/dQaTQXmxtzcAvlXC1YIab
         UnS7ZYQQ395HL+Ps74pulcJLebI4q6rKAh4xVt1rB6XtkUvZVmqGCLmtmV1b1zMWv8jD
         LuQw==
X-Forwarded-Encrypted: i=1; AL+hErHO+sVy5GfIUq9qqNdHKEloVhe5Dq+KwO30N2E2pP9u7b2J77mMN2sDfFwML5YyYqtqVW7oA7hhs3IF@lists.linux-m68k.org
X-Gm-Message-State: APuU4Z/QJPvAaZ+9LBp5fdqF5Hr1YviJ5VE5pNd4DkXqHsYeyMmBLo4D
	afP7wRLz1fqzoMDOtI/jZplgi5NY9m/Hok837mXyFFFx91/84O+DkcfqE4Hn0gAs
X-Gm-Gg: AZFdTZeXnNrvLKRS085NSjjlYCZSU9QwNbfOpavD441RgRx0t2sH4saq4Nw8+yIrsrb
	uUwed5u+3xEHIQj1q7dqo3NOdsT/xvb6GoeVvhfC6oiOnS2FGepbbdUN4S3jtDH1VzzTNVEfCDY
	tKKtJeXTG2JI+m8svZ4FfSVr0VCCGCpu+aI8UftUDFSJpsDlQyqib6ukVHORVCHx4N8TmxA9ahV
	9GwWrYD9R4gTpbSmbMonMgLUTMA2PZHznmZJGx21DEhZC3B3Unxmm0kprOteZcDZT1oZqlmzXxl
	tAqYb0xrl2jY7ZyMRxkQrdbWxoZGW7maSu6V9QVeNUVPFP2YjYl2UpIDlwhvXsUYUODXg8tiiK+
	rYL2eRNOUvqMbz0tgIvZQJxJwPSfjA2ypN2u6f3usynVvYOKySfDW4J/8u195OCY4UcJCXlGrhd
	mPHk05tyLlnLurTrTV7z25lfNCDrFABNoUCYF1aMthnaQVadW/WYBwA2QSS1MSkY9Kvj0bJxA67
	dIexp9CXsWqhkghqJHkYY+O5swP4DgN3uyV7gvKmeDZWag/K/zMbmkLkaTjtyVy4qXQj3IzLJix
	UjMlqNjB0+YSMYk4vMWOmrRzJQk30jVo9lmV39MBTjIZ5199a5H/SfUgtN6lWesqp9Y=
X-Received: by 2002:a05:6102:448b:b0:7d2:d159:f425 with SMTP id ada2fe7eead31-7d7394627fcmr6729823137.19.1795517311021;
        Tue, 24 Nov 2026 02:48:31 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e033aafsm14493760241.7.2026.11.24.02.48.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:48:30 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-99e0d9b3438so964099241.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 02:48:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG3/+WUl5e6MVaiMcoRHaZmKMQjgaVBimKhRP35cl7u6z1XGYACi10sIp1+Mz6ruH7Ihmegn7TCYGF4@lists.linux-m68k.org
X-Received: by 2002:a05:6102:6890:b0:7c3:fc96:fbdc with SMTP id
 ada2fe7eead31-7d7396b5a8amr5632287137.37.1795517310321; Tue, 24 Nov 2026
 02:48:30 -0800 (PST)
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124100604.2380938-1-daniel@0x0f.com>
In-Reply-To: <20261124100604.2380938-1-daniel@0x0f.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Nov 2026 11:48:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1e8_fNpciRaJxxJDUvCsV8bgkOBoPjpzUp=uPNWaM8A@mail.gmail.com>
X-Gm-Features: Aa3M54qB1yt6lqgJnmZUZ9UYgPzwgC5-7_fQiU7RevBgj6A490deRL9llFJVxM4
Message-ID: <CAMuHMdW1e8_fNpciRaJxxJDUvCsV8bgkOBoPjpzUp=uPNWaM8A@mail.gmail.com>
Subject: Re: [PATCH] Input: amimouse - Fix the buttons
To: Daniel Palmer <daniel@0x0f.com>
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Tue, 24 Nov 2026 at 11:06, Daniel Palmer <daniel@0x0f.com> wrote:
> On the Amiga the left button is connected to CIAAPRA bit 6 (/FIR0)
> and the middle and right ones are POTINP (called potgor in the code)
> bits 8 (DATLX) and 10 (DATLY), all of these are active low according
> to the "Amiga Hardware Reference Manual (3rd edition)":
>
> In chapter 8, "Interface Hardware": under "Mouse Buttons" a 0 in CIAAPRA
> bit 6 means "switch closed", and under "Digital I/O on the Controller
> Port" reading POTINP "will produce a 0 if the button is pressed, a 1 if
> it is not".
>
> Invert the bits from the registers so the state of the buttons is
> correct.
>
> Tested with Quake on a real Amiga 4000.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Thanks for your patch!

> --- a/drivers/input/mouse/amimouse.c
> +++ b/drivers/input/mouse/amimouse.c
> @@ -58,9 +58,10 @@ static irqreturn_t amimouse_interrupt(int irq, void *data)
>         input_report_rel(dev, REL_X, dx);
>         input_report_rel(dev, REL_Y, dy);
>
> -       input_report_key(dev, BTN_LEFT,   ciaa.pra & 0x40);
> -       input_report_key(dev, BTN_MIDDLE, potgor & 0x0100);
> -       input_report_key(dev, BTN_RIGHT,  potgor & 0x0400);
> +       /* the buttons are active low */
> +       input_report_key(dev, BTN_LEFT,   !(ciaa.pra & 0x40));
> +       input_report_key(dev, BTN_MIDDLE, !(potgor & 0x0100));
> +       input_report_key(dev, BTN_RIGHT,  !(potgor & 0x0400));
>
>         input_sync(dev);

Nice catch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

That bug was introduced in in full-history-linux commit 7c40d075b02b3ddd
("Add keyboard, mouse and touchscreen drivers. Add tsdev, power and
evbug event handlers.") when converting drivers/char/amigamouse.c.

How come we never noticed before? I did use the mouse after that, cfr.
https://lists.x.org/archives/xorg-devel/2013-March/035831.html

Comparing drivers/input/mouse/inport.c to the old drivers/char/atixlmouse.c,
I am wondering if the same bug is present there, too?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
