Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE4C38239A
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864970; cv=none; b=WA+teuZrx34Jy3DYQocjmgWU+X+8jcxJreLGXez6WJk2Pv8I0AQ1eGws2n+GCkCUxC7+P/ShFucroOPD+FfpbT5FWZyxOa3ZCxXXiaH7F+rUiX3bF+fr9Bqi0ZyfjrhJtkAj1qa/eq4cPUuPuXW/UQfQwXRpUO1vCsC0FxyZ0WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864970; c=relaxed/simple;
	bh=Tmu7GEDoa2qOBMylbxEhvsmd5/gTuBwYz2MPu0AXU5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaJgD6dK0dCI3Qzk9FkVIKKui136qke69pu3pHpt2BX4uJgOmzOAeY2NQKNjElbRDo9TezG5lldnH1Rxs/0cXvZuS/QAx6vfCSxbmwRA2ld1gdF9rj+7vXgDh6mkQbELzvyj4WG9/if1JRzOe3u18vawnDoSCl4CD7MWgG2g9eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-951c5ac6253so1204553241.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 03:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864968; x=1775469768;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+U9MkFhUdzmY3Q4qlBKu6mCZU308+8RIkLrXa4lyLHw=;
        b=noiVN/H3KzTxIltmYIwfVD2dSHtb6GZ1ASfnt8n/blWTd+8fNDFVSX1eaopZQnZrz9
         AEDq01XW8q/Yk7cL8pf2NUbbrYo5HeNo2cvMbDjtLxa9wnDxgt2CLkNgN1G1hJh7iZhq
         Kf3QkbkbiGRRK/smgrGN9/zO5Teke8lHbVf1PlTlhRYa7D1cqjg/9oH+6GaxJe/lfSex
         VmFwpPxlfn3Y7tR98/HpzOrtk0qSFA1Zd9VzrBYTzFcF7Cxr4qkz1PX7DUO8SQRJKJF2
         6qpsWatzOcGJkh/iXrA+ljrOy5yROtVOIlSj973k3qVO06Pf18i2vmGnuZXDXbVXNFZP
         rtGw==
X-Forwarded-Encrypted: i=1; AJvYcCWgBU9IBHhY5sMlyVFVZncXxKc2+A5YLqO9CP8G06jBxBDFITIZ7MqJYxtTjlVL6OFW0p0/KqvMouPX@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yz/p8N7zYRhUUyT8RnZre+4/dxaaV3MTLC1usU1xS7RJc8Zi4CE
	mexRdGaI2VmZpMu/drlHUv0p4Bw8hjZ7y0kf4yRdKRpYYUSLqVbo5TpeS2bOc27Q
X-Gm-Gg: ATEYQzzIf05uqtjCZzh3FAQKhzlC6QsZPm4eykQmzt23wNW1mZnlJzlx4bn6qtyI/UJ
	O+YexOckoRmk/tRCFzH3DsRwTgZYT3zJEKBn2i8vkqFeM2LnLzac2hFZkpNV/B+V20nsQN/Lm3N
	QYM2VlyfK+iuXhYIgjQryJjXFlGY/jJZbIHBz8ds3qybRRQ2RMNlep1ptA8Vt9onvMvEcmv7mbX
	LKo+8zRNzdU3XS1t0XGxsQy8ZVzEWf/lPeCFXksJ1bNP1E7wCDRv2YAs36Hn5h4KCMkyLgKPoDn
	t9VmuHJZTXeJGn6cH9JZxCrREvrx5QoTFGyDR/psLwIKE9hXAQJASqrAIPCT5DyATLxznOc5GET
	nE5AIZOFgejIOag3KxFC4+orhQKwdfedZaqn3jLRQjO73g9ZxoR3mRvtc/9gf0MRt+H9hiqSu8E
	fDsvrV7P0qUwU6HSyhoWM460qI3rjxkry3qgJ2le9YAPVFbwboV2PrUL+Y0ti4
X-Received: by 2002:a05:6102:3c82:b0:604:ee6f:18d with SMTP id ada2fe7eead31-604f9355212mr3933074137.35.1774864967950;
        Mon, 30 Mar 2026 03:02:47 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d39ffesm7499544137.8.2026.03.30.03.02.47
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 03:02:47 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-951c5ac6253so1204546241.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Mar 2026 03:02:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVrMZ2On/0vDq4vfuf40RFOjZ+FrncCN2cjp5v9X9tGuHaurRirEKCAg+aNqUxITG0CB6pG68+yBjBK@lists.linux-m68k.org
X-Received: by 2002:a05:6102:441b:b0:5f5:4eac:cd2e with SMTP id
 ada2fe7eead31-604f9319a46mr3778424137.32.1774864966965; Mon, 30 Mar 2026
 03:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227101643.473010-1-daniel@thingy.jp>
In-Reply-To: <20260227101643.473010-1-daniel@thingy.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 12:02:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-A49FWv4g-RBRkz6DLM4sNOAtWus0zRq_hTZQNaN8FQ@mail.gmail.com>
X-Gm-Features: AQROBzCAvqX5gSYFeLRsgYv_6iA-JzYR7Xp1-QUuQdUrzwqFvH02a4348bYGD2c
Message-ID: <CAMuHMdU-A49FWv4g-RBRkz6DLM4sNOAtWus0zRq_hTZQNaN8FQ@mail.gmail.com>
Subject: Re: [PATCH v2] parport: mfc3: Convert to a modern zorro driver
To: Daniel Palmer <daniel@thingy.jp>
Cc: sudipm.mukherjee@gmail.com, joerg@dorchain.net, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Feb 2026 at 11:16, Daniel Palmer <daniel@thingy.jp> wrote:
> Currently this driver causes my Amiga 4000 to crash if it
> is not a module because it tries to iterate over the zorro
> devices before that has been setup.
>
> Convert the driver over to the modern zorro driver API so
> it probes like the other zorro drivers and doesn't crash
> my machine.
>
> Claude was able to do the manual work of moving the original
> code but I had to fix up some mistakes, clean up the
> allocations to use devm versions and so on.
>
> Only build, boot, and "checked the driver is registered correctly"
> tested as I don't have the card and it seems to be one of the
> few things winuae doesn't emulate. Using claude to fix it up
> seemed better than just deleting it considering all of the effort
> Joerg put in to documenting the hardware etc.
>
> Assisted-by: Claude:claude-4.6-sonnet
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>
> v2: Clean up how the interrupt works a bit and return IRQ_NONE when the
>     interrupt wasn't for the card as suggested by Geert.
>     I guess this should work but without a way to test it this is best
>     effort.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
