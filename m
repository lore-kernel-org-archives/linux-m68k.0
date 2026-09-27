Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8AB2DA75A
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518585; cv=none; b=RCJg0OGaXeExd/KKFcCW0o+KpH/f5gTT+5XehxA7E0ImzyLVqegvdHGpwGfFE2177ffwkco18dPMwazqsZEToqfZxrFSuA55CpGhjF/eU2VYyTAFEoVHeZdHVgnLvz/SZgTJ4KXgKXJ66WmjAtb9zZhFvDttaeEE2lnf+3P55EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518585; c=relaxed/simple;
	bh=/XwSdfF+044rUgyrOIZNdmuJ/A7mXol293yRwESL6lU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAhgZBfMQEeikZD9n8aGKtPSeCDhlXk61qtOn4d/MTdtdnOHPfrZXgPX5pDf3kRj9hxEbIjEBkfKt1wcixHm3BrTtL3AkKuntIA55rodx6ZkRGABcjsAXJIWtfkPyBsFFyfWKfv8BqFqKWlNKghfsksxwmmrQExekw0ibt+iZIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97eaa1155fdso426393241.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 07:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790518583; x=1791123383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yZul2+MEjvVjxyG2r6stUnfr/1uKRHHyHEXb7+uRqh8=;
        b=Z7lVfT6AC3XOKIZgsodRq3RhPzlhKqKL1RO5Eh+c1gBfI1jRI1AzbACYvtyKYjXRwG
         GOaY9+Qbvz2TUtb8pV4+p+ReqanuzaDtUkWYoGDzWmQmakMLNSxrt2vrIOxUcInBuLIc
         lC+UQx3QOpbSQ2hJwLT4uYUm7L1KOPwkKVU+9dW4KVHPZ9IwTGSwJzKUukHrqBkkif8/
         rZpUrVFzxTxfmxSanDDVeC8btFgMZF3Dl3RCD1P9ZJNGO1oXx+zshoItB3NrGAdI8f7D
         sg9Dlm94JbkY3m4jwoI46vdKnnbSUYklQPWUQJ1kW9HnXjr6YShfTZV/sdbIAy6RqNKU
         Q3NA==
X-Gm-Message-State: AFq9FYIsL+uqhK4dAMUL3bCd0muHoip+TBxSBQJE++upLIF+lspLOj6c
	VebjTVYvd1zrrmYkcb3Qm2JV3/w8cyO+jC0FSyMv7Wiqi8zCLdGXbJyIIJhTCkii
X-Gm-Gg: AYBFou2bDJguXbfMx4Dvqh7aYVbjQVeqibI+ZGZtJnI9HfwULJMQMOXjz58ULAxY4HA
	r940mIZ9zKjKiMbtrAisTukkrF2VklEDhO4aEhcalvI0tQKufjcLoLL5RYdnRTrPbdj9RXhfFhO
	kwo3QPdPE24qVy1vxvAVHzKZ2bl45zfY8C0CbMsM7IKo/66E7TPBtA1lPH9cBwz9c/mMVbZn5qY
	3h3UkMrgbXmwDnRvXs9hSBB8HewnH5JiiDOwZTkhF0WY+Ipb2iPg0bGszXtyjcPB5EEGiQ4nWAu
	oE493VKvaZJZ1iKKQ8Fga4vlBSboM8I0m85CP4K6osZmutByZGjwdI4IcIgcbcZEv2uELbDrjjY
	ry4sG0GPfBe5I1xWdepdY2HdAsB1KZ4jAmJAy12rK4/lbeo7eZlyp/HQRtsmWwcG/uPE0EVwTiO
	NuQ2kLbUcVmW+AJILrKCwc92421O77/bfy0XbdAnS1nAhHXGmzz6bPEwD7MWn1eDg4qcD1wQ5wA
	rbwHISCVYYMA8Mt8U1bsZ4rLX8P1MYoPz7h
X-Received: by 2002:a05:6102:f12:b0:7a5:d652:2e3c with SMTP id ada2fe7eead31-7af1cfa48e8mr3695888137.9.1790518582804;
        Sun, 27 Sep 2026 07:16:22 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b08af8asm2775049241.3.2026.09.27.07.16.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 07:16:22 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5ce4d8751cbso317887e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 07:16:22 -0700 (PDT)
X-Received: by 2002:a05:6102:5129:b0:7a7:3485:3386 with SMTP id
 ada2fe7eead31-7af1e9f48b4mr3427784137.24.1790518581788; Sun, 27 Sep 2026
 07:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731094402.741645-3-thorsten.blum@linux.dev> <20260731094402.741645-4-thorsten.blum@linux.dev>
In-Reply-To: <20260731094402.741645-4-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 16:16:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOVeZZ1x79T14kBWxBZY-+FQYK1WhuN5+Vv7KGXVGMMA@mail.gmail.com>
X-Gm-Features: AclHuK9DYh46tGYLxKsX0NeKdBugbu4_C4Y0o8fi0yLPxiReP62zN2LjQEAKld0
Message-ID: <CAMuHMdWOVeZZ1x79T14kBWxBZY-+FQYK1WhuN5+Vv7KGXVGMMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k/serial: Add include guard to asm/serial.h
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 11:44, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> Add an include guard and remove the stale comment while at it.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
