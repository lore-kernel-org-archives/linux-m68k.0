Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E4E2951D0
	for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927172; cv=none; b=CR4e4J0j78rtJGacNnzIl1skIgC5Vrw3AkuHH5tcUpSvcNuMMpdn8JMklf7/xOh5CfAqo+AgiI4kcICC2/hUahBfk3R4RHo11uD7k3IiflgOHFYJhU1lG/qPoyb08JtMuRJe3o0QCzbQKm6so9CxWskSqy84z87u8QAM+KTW7Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927172; c=relaxed/simple;
	bh=6PaV7JJYXh8KsTODrQZtbOXxqLUgltfiOiPWjBNzpr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtKzT9KSAyUJe20PPzMSMUpxPTDPLI4D6Xqz0OQQr2prf5HvSN1s0uZFY+0KdqV43FdXYPNaCEEAvHS/XjhEwfJR3RUGZ9W2ElABYyF2c42rSecQ6xDUSNU1AX0SmUdXRDqYqtkFGrtTFOrj8Sb5vSVyqlVjADRAege2Y4D8lCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5316a5e4c6cso249832e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 01:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927169; x=1751531969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lob2G1MzEWqPTCQFL3Gx57+nKxmTHYmjapAHnccB6w4=;
        b=C3V/c5FJ5NuSzbP9XADZchv0XxiETDhg55L4m2EyJsaK2hZ9ongHQgZMru9C2pMOub
         eyIkPdq5Z8vH21ZV9zvqjapB5b6YFTwtcyf3obCdt2Gk0b5igPFzTb7+oyG+4wTMWP59
         kInv5b1gjBTjFsZwpjxwHRKNCdZ8Ia1izFBcZuf8MR9kyvLAwoNPXz6VfO26z8njW/H4
         5wIJ8nBid9CBm/hfR7xuGwRIdzN+JppCK+8lTYwU1d8p61Ii7kTofyco3qhZDsJuyRrt
         z6n3sQrD0MQlYzW9Br2aq7ch+qAEs9sb+Kmu6AI/Wh2YIPBOp3/bH/cUgC2vO5CbH9JP
         YCpQ==
X-Gm-Message-State: AOJu0Ywp8PYD8rw6fZzGrkWOlh2SE7I85F1J1SphsgnOWLWXQWC3yu0P
	E76vAEYtgDi0nbQ9LFgTFazx/3RkGb3ZyK1Cdn5vGOlxxVbCWIeqUV//ybG0jxFf
X-Gm-Gg: ASbGncsLJuJPvMKp7ZeVmg1RulbL6ISISVZ2DXOUYuME2wqByQ/t8uUjbsYLGa2Gr+3
	nRkPsgEdaAYVZHuFUA45nojaAvbTELCKulyMlMe+9pXk1t5s8i2uJEsHsvHvgGDGQ1ZlIEazqls
	8TgC1Ann9MOHOmz5IMmXkwNwcH1Trtk0L6O6IVFlI93tmvZ3YdKgia5rCunAXr9lotW7BiPxHhk
	oMtnYUBcppgiksE7K+j9f5v0gjLvy4CEDQPHzVd/PGIrj+yreAQL/aNdEw0LMIpI7cbIRZyEqbe
	IdP3ihgcoEWBqRWC4qFPPz7vT33DL5aySSFnDo92CQPNIzYXJ+OJrEsEmFbTzOMRDnk6bnHD4T3
	GMSuEtCQyVS57ImBjlEymfe3O
X-Google-Smtp-Source: AGHT+IH2OOkM3wggZ/vTqj9pmzg4z8NeAOumxexZh4cl9vQC9ypw+5sjC8ptX4qkQG5VGXpsUfSCyw==
X-Received: by 2002:a05:6122:16a5:b0:530:7a17:88ce with SMTP id 71dfb90a1353d-532ef65b2d1mr4955390e0c.9.1750927169372;
        Thu, 26 Jun 2025 01:39:29 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531c37f0f31sm1570805e0c.22.2025.06.26.01.39.29
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:39:29 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87f13aba2ccso137399241.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jun 2025 01:39:29 -0700 (PDT)
X-Received: by 2002:a05:6102:441b:b0:4e5:ac0f:582c with SMTP id
 ada2fe7eead31-4ecc767318cmr4581498137.13.1750927168822; Thu, 26 Jun 2025
 01:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611001255.527952-1-vishal.moola@gmail.com> <20250611001255.527952-3-vishal.moola@gmail.com>
In-Reply-To: <20250611001255.527952-3-vishal.moola@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jun 2025 10:39:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWg6peQCvAbc9pDpwbWaihFgmLXqP_8wCJj0LqM2Aox3Q@mail.gmail.com>
X-Gm-Features: Ac12FXyvmwAXyOKQTays6DxovKUCjymJjBQVFK-JHF8Pq-Hwz9BIIkfjRAbKh6c
Message-ID: <CAMuHMdWg6peQCvAbc9pDpwbWaihFgmLXqP_8wCJj0LqM2Aox3Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] m68k: mm: Convert free_pointer_table() to use ptdescs
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 02:13, Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
> Motorola uses free_pointer_table() for page tables, so it should be using
> struct ptdesc, not struct page.
>
> This helps us prepare to allocate ptdescs as their own memory
> descriptor, and prepares to remove a user of page->lru.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
