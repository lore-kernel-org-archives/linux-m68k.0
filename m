Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50630194C98
	for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Mar 2026 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948166; cv=pass; b=NZ7/Auv7pp5pWlbWyvhhQmKNAOzuPi1sRtrFzUvIqrySW3rcaSPBNifHqCZODocD1CKQ4PijC+kIk2N0W8S1GmGaTl/srGk8DhJtUbW+w5M7veRrE0Londn+DLxwsNyMlBQlb0HnIg957V+zPqnf1ZqfsZ0ZzpUTLm4CQbeO1Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948166; c=relaxed/simple;
	bh=fnOkGY1L0/GQreleZNMqLbbJ6xXiBxWKGKLRpfhzTcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OILFBs0elZAbLn6U5L3ZqQsqI1vcG6RBv26dgn5bT+jHFlyokyjj0JEzdNGcLA9hS80dLlrvgWNfq+d6KdZ+cbB+jlkh5OT3bWahrxRfMnF/kcgYy9uIcbaUV3AWANh/SfBCrZpYRaE75iPyPohrVG2vICGilczhADeFptbuh3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=e+Z79vkw; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="e+Z79vkw"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82735a41920so1786061b3a.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Mar 2026 02:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774948163; cv=none;
        d=google.com; s=arc-20240605;
        b=Rmkhxza1kM061xdjwjgEeSd5bbfkTyhwvpRETP5krtXymOtJQaXPQDntL/vzIs3Ti+
         mOjZV/9tx7mKciJ2BSCiQ+fkODZAAawMt6TLy1QA7kbJOLk+JecSpHnw81h/nRu5Wv5y
         8yzvI4NvR1akKTalHQ6z13km3t6RFeaGEHaNQmiCPEFtTpvw+6oG10llpW6/5IuECEuv
         99eWDC7gFbcSD/TnfV0yETW42elUPncVQSASzBiS8PR4lpsFJ02g0mkXmi5ncAD6m17n
         0IsU0fiSn2IwINdiuffxab12c26ValrYpbhr7JtnLgr5zAcCsDneAQjvrt3w6MzlLp9X
         AzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fnOkGY1L0/GQreleZNMqLbbJ6xXiBxWKGKLRpfhzTcY=;
        fh=BBVijmXoxlUnnNE/hsPxDcN5NaXq4wfUmVjD+C8RST8=;
        b=CbJPV+qIvk8bsre3lYFXaKaLImKlOiGMtXR8pfxZN5JsKwy/sbk96f9DVSMqgFT3IV
         PD9VspwGGcqapzl1rNQD95OSPHqk2fAntaSPLU9r54UX1mfgMFoOdfDwSvXxO7T21x45
         kNTjrLG2XuDV4Hle24bAJrUV2l7zqmlM7GZpWc8EMqmP1xWp5cIwFf5laZyEoek2AvEy
         vnYeb1I6QGZaEU6fwB/FT85OLzqA2aPWnXsiZNRyFW2ZQV9Ab1ohkCTLzbyk8yxKQlrD
         pis1zP2rvNBBpHivXgbvtCoyZcLxjEvyaUb89XxxDf9bgqxQEKjzt+ROWzYusxL8LkVD
         8bPQ==;
        darn=lists.linux-m68k.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1774948163; x=1775552963; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fnOkGY1L0/GQreleZNMqLbbJ6xXiBxWKGKLRpfhzTcY=;
        b=e+Z79vkw1QwDTOj65UFnFXChlMvB5ECmMdcwLXMlLti+dDV4ou3I+NEUk4f22hfx1k
         h8QsaaYKbpsNrw+pfJU5hJQyIDtB8UqqPcfjyoudwQ8VdgRC/MsvNss0lSTUpcn/O6ep
         8+UavZyT9veR4txw5OzrufB3O4BcT2lmv1e9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948163; x=1775552963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnOkGY1L0/GQreleZNMqLbbJ6xXiBxWKGKLRpfhzTcY=;
        b=mx70sS9rJ64qagf9rMN7m+QExHKubxrEpRk1KVZvKAs9AyMekRq2kN+Mj5plPznEqO
         E1YV0l1I5kk4tGxrFQgf5ulZoixIoasC6EIkEbdm4uwnBRl6kTmqoMXLyqzQc/7Uk5IQ
         YMFMVAGP14+s3xDRzTFrOXSxxBNjMnSRZxJ7SE8rXTNlG82PxvLugcqU5Qhch4KrwXYL
         3K3w4HwttGeDS+D9COeMBZjOJkSiIFz+CT9Y8T+ozL5iBCeFuvmMQMNa2BGlzx8m5G0+
         WS5DiaRAFZHt28mBttoDYWBa2v2Q8Lh2w+myhlieisqnCcai/84xvxao7w5BnicnapdQ
         oGjg==
X-Forwarded-Encrypted: i=1; AJvYcCXPe5p9sqvz/qUjBLe6vPUsDUR1y+qXAq68z5y1nWIiEZfF7Eg1RWrzeZ2Lyiz7RcQShrfRYsk/Hg3y@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YzFOWcjO3NStl1Adf9nMJEkSQ/Hdm4zFzO9TTeGlgP1kSjKAVYM
	idArPfzHxRF3Fz8mwxjVxwTrB/7e+7jEU3tBivPrrCxW4DvO4w+KZTGeUyaYb2w93NvLDNnLqo7
	7heDBmFN9f9sxpxXofv64ppulKze3e776RtcbmmuEKA==
X-Gm-Gg: ATEYQzzUcZbIgMJPJxh8fLfYTe1V7IpTj8aiFBUUTtlI2Xbrm3dtYn5mdthf4U7L7Yg
	yPdzhMQ22SZeeNOs81Z5wuuCuBqNQMz93bMPgbBJUdwaHtL3TwGaRBMx7LyvZhtRRKxH5sOWS7m
	/B0Dt6Pj65Aa+LA9cVwv0CeXQSwAGoOEV+HWbGgfyNG4dYiWbO7+4+NR1zoBvpoKHYflBPg8uoH
	P8/WpPhnf42Ce8lG/Pv9ZVxvypIErjZ2zF4UMgcLUVhz0Nx+cXXBWjCWjKzfiXDge6VhnPqpCP/
	W3v87USm8CJ1/c8ZMgIgkWj8lwI1sScqij+9AKiW
X-Received: by 2002:a05:6a20:914c:b0:398:71e4:6282 with SMTP id
 adf61e73a8af0-39c8780d9e4mr16026557637.4.1774948163540; Tue, 31 Mar 2026
 02:09:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227101643.473010-1-daniel@thingy.jp> <CAMuHMdU-A49FWv4g-RBRkz6DLM4sNOAtWus0zRq_hTZQNaN8FQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU-A49FWv4g-RBRkz6DLM4sNOAtWus0zRq_hTZQNaN8FQ@mail.gmail.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 31 Mar 2026 18:09:12 +0900
X-Gm-Features: AQROBzCkaCoak2YJoDHn3OIBj0_YpkQ5yntdaJ05LETovXDuppo1GW0IFrJNmnQ
Message-ID: <CAFr9PXmF+311dNrFd-xmzyMuQoZV95DvZRTauoHHZCzR-5piFw@mail.gmail.com>
Subject: Re: [PATCH v2] parport: mfc3: Convert to a modern zorro driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: sudipm.mukherjee@gmail.com, joerg@dorchain.net, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

On Mon, 30 Mar 2026 at 19:02, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thank you for the review. It seems like the parport maintainer isn't
responding (Andy has some patches that haven't been reviewed or picked
up[0] too).
Is there a way to take this via the m68k tree because it only matters
for m68k or something?

I have CC'd Linus, Greg K-H and Andy. After googling "LKML how to
escalate unresponsive maintainer" and not finding much. If this is
wrong, sorry for the spam. :)

Thanks,

Daniel

0 - https://lore.kernel.org/lkml/20260122090601.2380747-1-andriy.shevchenko@linux.intel.com/
