Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C23394E80
	for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Jun 2026 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770778; cv=none; b=Ay1Ya0VUJabjDkwPRUQFUmKI+H9uwkoqb4aWyFV/26yNtn9TrzWZVJEc3JWfgZzxjfBgV9mhHI5ATtPiMRAbynKX42sPjkMjDtqPtZhZj3UiucnYp40TpVttS4qFSWP4fI3Ec2AGpwYoT3LnL1fyW4MYT2OV8u9hWSyTbhq2eKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770778; c=relaxed/simple;
	bh=qT3TGQ4d0y9tUfJc/hPKLXqZe+/2KGNG6EH7xLEU0DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8FhFQXi9z+BU8ZGI/BPYT34YCJL27a3vaSDe/oA5hWqSI4zGI3owy6JJpthBo/Cx540Bdc2CTT+6KgzD+gHLMiQhlsmyUEdwQSici+qd5Y59PbDsN/LcpM9gKDAbcQ3RmWvB5bUSytHS15i5/ohDeJfJqjoZf8JGuZv7TQ1MK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36d8b644473so484483a91.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Jun 2026 01:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781770774; x=1782375574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKAZNU0FmJW8v6thQLRjRHc5rQqn36zhhyWy7vfjOZ8=;
        b=H6/3xOBYmmSAFcIjuI421RM2EVetkYXGXv7J7kMIo7P6EAyvmlv1cfYY0SCiouzKoI
         +QW8q6mq7zCuOTnIz1FEiKP8HZNNsazYd5LNinDOEtXDD+8thd0hXVyZ4ph3Ftj7HW50
         aJqes8Wk5B4w4thE/oJlH5Rju7polroALl6EzzXqLrIEbVTLkYgs4Av5AT2MZC9Cmk38
         4lxh9/JYxmnzDCMLvcoY5uDhum1Ax+GFmJEnAe9X6ZVnwn4lCkTtuICwOiqhjjnAn3/g
         XOTpglwvAQaSGCmBJrfKXYUFSJwWrp3zVZDxwOkRp2vR2aklf0qADRkcOZLOjeoL4gBl
         fJYA==
X-Forwarded-Encrypted: i=1; AFNElJ+D5DbllEGRt0zdkUEJ5c/OLXg48jBmLehhonEY1SUXJzSCilcJIt8zhCM/34vgbiSFYf4pYJSi12IT@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YxuBqdeWK1qsYnkunHRTjyNimAZC2ajCkQrpFkOnoTWPEh2lDqy
	PAjUR6lkVZAzi0Y1yKD29gphh+FeqkU+sSAVc5/vx0VAIfeTggZcKA2AajW+Fy++
X-Gm-Gg: AfdE7cncx8kAszttGyo7/Cihl8zfNQoA83sSXRstdDRafhma6PDbnKVw5KnJ9SZTcJ7
	UvCpKwUQEO4qoAbEu8J+64jPJdoSAPTIJ0lC6tGUrXSuVsnpYtYmATnddcSuQn73UYOkacNnqwN
	a+1D3CcPJ3JpJggrLMnDmSGke5IJq47Mta33ZPUOfgWOZ/jHX+kAMH36me3YkB1Bds+vqKvfc4P
	qs2KSjpEcblcy0kItJIXk1BxwGWCQxu58MPXhplhxYFMCdk4lZEegEndaUsJxDut4rkXahrW05l
	obZdgNQyF768kBsB/POoO1WiAwQvVvGGaENKulDzj8OigQf7X59w4x2tAiBPEjKxJueZKnvxeTm
	SyaA918tJPVZ68trz7Qj8qgpZlesg/pPAbww8aBuQpziCjOeHTVDpoKwP4lRo3Siib4qdzu6Y1W
	hoeroaqgTRwIBGSlWeQkI3QtnYMzcbY0VGLnTj+MiaoMy8PZ0KmmhZInpJL83ml/o=
X-Received: by 2002:a17:90b:2e85:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-37c94b136bdmr7771078a91.23.1781770774481;
        Thu, 18 Jun 2026 01:19:34 -0700 (PDT)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm188912725ad.53.2026.06.18.01.19.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:19:34 -0700 (PDT)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bcdf8232fso1687204eec.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 18 Jun 2026 01:19:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ99ubzpaEZiat5rjXTu2VH10REjbzrAggh139Gj3xvs6rTq7B6drUncFXRuAbh7y2XowZ/DKxV/VAWa@lists.linux-m68k.org
X-Received: by 2002:a05:6102:1626:b0:634:92c:bdd0 with SMTP id
 ada2fe7eead31-7245cec5b37mr3787588137.6.1781770401826; Thu, 18 Jun 2026
 01:13:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616084901.3319d82e@kernel.org> <1781694488854.956546368.818588236@strotmann.de>
 <489024bc-b6e5-f601-3bce-444d75abbf5d@linux-m68k.org> <2791b2e3-bf58-4dce-9262-4f1d8d3241fb@lunn.ch>
In-Reply-To: <2791b2e3-bf58-4dce-9262-4f1d8d3241fb@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Jun 2026 10:13:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0em2r-SixT_+EpWJnm4f0g8mReYKBXOw42=HGb_T8WQ@mail.gmail.com>
X-Gm-Features: AVVi8CfLJ0ddT-LhKt0W0uHSh_81VvaoqDXBIXepEwXCQOI5G8FSGq0oRl6-8XI
Message-ID: <CAMuHMdU0em2r-SixT_+EpWJnm4f0g8mReYKBXOw42=HGb_T8WQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] appletalk: move the protocol out of tree
To: Andrew Lunn <andrew@lunn.ch>
Cc: Finn Thain <fthain@linux-m68k.org>, Carsten Strotmann <carsten@strotmann.de>, 
	Jakub Kicinski <kuba@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, davem@davemloft.net, 
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, horms@kernel.org, chleroy@kernel.org, 
	npiggin@gmail.com, mpe@ellerman.id.au, maddy@linux.ibm.com, 
	linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Thu, 18 Jun 2026 at 10:01, Andrew Lunn <andrew@lunn.ch> wrote:
> If the appletalk community can take the workload off the top level
> maintainers, respond to all patches within 2 to 3 days, give
> Reviewed-by, or make change requests, it can probably stay in the
> Mainline kernel. Otherwise it will move out of tree.

"2 or 3 days" is rather short.  If we would have to move all code
maintained by people who cannot respond to all patches within 2 to
3 days out of the mainline kernel, you'd end up with a networking
subsystem without supporting OS ;-)

git grep three.*week -- Documentation/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
