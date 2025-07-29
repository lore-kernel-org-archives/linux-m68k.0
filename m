Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4A6295517
	for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Jul 2025 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804185; cv=none; b=NF3C8MBRRpN9j00gVHGPUl5Vj2XAYzIFfsnvydZ0vDFQSoWvX14K9uWGicEU5d66kgnBUl6PRT/RkEYngOsVOXlsHQIXh3lfS26MKiLfTBrH/8Ni1CqbF4U5BDVbnFCsgI2xD3DrvppAu43+I+j7HyYukJ942+tBJmt7mN4BZ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804185; c=relaxed/simple;
	bh=xOEAeeQL3t1RcMvLNfRNpf/bSygqBiYvdQLATWAkt5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcoMEnVaqKcWkqH7NaMIVR+zpMuOuNApd61zDj14LG1XIMmQ6KmhfbAOz0GKuPrl3KtpCo7Fi2pJ/3we9oKqrj2rn65Is39IJhXSGTJltUSDbTj8HffhL0sXNm83zHW1JbBLMInFM0NgCzCWSrw0rZc7roD+G9NJ6mYKNm1IuCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-538fafc4935so1480565e0c.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Jul 2025 08:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804182; x=1754408982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wADgSHvwlHUwTHyzEE7Zo53BPHoQdaEMqx/JOShNjmo=;
        b=v1pRDauYuyh/eiiKQaOViPwxWeiYgWBkx7tPOcnGkUHeWwJGGo1VFbNrYo7oFom3hh
         emXmdDh12KtCqzvaDmawO5IZQsltqO0eA3vYX/FDgi83MWk4TWFr3xuaQ9t8vnxjIqxx
         vYcZhCOhoNTdxqaXrJ6pBy88ljKaB8rPS2RAprnVfGrJL9/mu8l7fr4BH+GQjKdgJCQw
         LU/2OGiF/WNBsmQ8B+dxpUqYFu1prxBD+uWv+yzJPRRr0JJ61Fyhhd/us2/r1oG2Oa1o
         jARnndIEyT4Dtgjpz07boGD7w6lG9QHnROXyPzQdmY+YufJdJ5J3Nil7tnRMRv1Cr4GV
         0vDw==
X-Gm-Message-State: AOJu0Yxt8BmEGOlrkw2dP42tfYh3z1RLkbdlIwJaPhzz5Xd4E5vxm1ry
	tuJn0CUGnhoi8D0KndeF8hxNEuWMAJkLo8BEH+GIStc1qUWgcqgyyxK4oneicFzh
X-Gm-Gg: ASbGncu0vXOBrsjbaRWFQxDJVGKaX+ZmmBGQvfZs2N4mtsMPhy1J0H2bvUV329+cz1R
	0h+/lOBWP4xK3zWwQInQwKX4aLGD69aZFdOIU9fEQ5QR4BDm4R5GNrnKF5TF96Qd4lStv9R2jK1
	zicg8LLIOk8XliS5g6I2KN3aXBaw4mn7Q2oH1Y3ot04SNHxMyQeEF2ZYGCpb3J7P1wpbd0BIeKg
	eplU+NQjUGrHmIK4U2kwr2hl6dCALUv+xLLkQukSfxYseZzO1aZOYxVQ6gvMCMDaDEnW2qGZhrL
	P8IeZYmKUZgdR7U3ruIDrmTbEEeMH7zPJtrKc9WSSzyUNP4RFsF4uDKXOe1rXdA8eKyD0/B2zEN
	pcpJUlOdcYNyT01hSUTyWsYUWxacD5a/OeElK5FvLuiB6hPRBKWv65wtIHuh5
X-Google-Smtp-Source: AGHT+IFWH5rft4kcfOHSKZgRZ8nRjigL56v8ITEc0YYp6mB/mGq7hfXV7qpUdtf/rpQ3YUVaQbxy/g==
X-Received: by 2002:a05:6122:a13:b0:537:b126:bf07 with SMTP id 71dfb90a1353d-5391ce9e496mr308103e0c.1.1753804181804;
        Tue, 29 Jul 2025 08:49:41 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-538eb0b86f7sm1789099e0c.18.2025.07.29.08.49.41
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 08:49:41 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e9a109035bso4055182137.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 29 Jul 2025 08:49:41 -0700 (PDT)
X-Received: by 2002:a05:6102:8026:b0:4e5:8eb6:e8dd with SMTP id
 ada2fe7eead31-4fbe7f213c7mr299399137.5.1753804181235; Tue, 29 Jul 2025
 08:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728093412.48065-1-jogidishank503@gmail.com>
 <CAMuHMdUkJrsug-hKkM_f+0xxrPHBQfw_3WB2FhMM=yAYzRn1Eg@mail.gmail.com> <CADorM-9OnP2zbtn6FHp-3NcO8nfnwC_RbzdcHdiUJCPXyMy8ig@mail.gmail.com>
In-Reply-To: <CADorM-9OnP2zbtn6FHp-3NcO8nfnwC_RbzdcHdiUJCPXyMy8ig@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Jul 2025 17:49:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3JxeLEnbPqc8_Qvpr7mwHhsZoaWwB8QXTMbYRYW7-Aw@mail.gmail.com>
X-Gm-Features: Ac12FXx2zcj8uSpr-DclIbXGTBctpzKN-BF1IK0QUMN4DdI6w1-myOzFZAJSa8k
Message-ID: <CAMuHMdW3JxeLEnbPqc8_Qvpr7mwHhsZoaWwB8QXTMbYRYW7-Aw@mail.gmail.com>
Subject: Re: [PATCH] zorro: fix checkpatch error by avoiding assignment in if-statement.
To: Jogi Dishank <jogidishank503@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	darshanrathod475@gmail.com, Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Jogi,

On Tue, 29 Jul 2025 at 14:10, Jogi Dishank <jogidishank503@gmail.com> wrote:
>
> Hi,
>
> Thank you for the suggestion.
>
> Additionally, the conditional logic is inverted to reduce indentation
> and improve readability, aligning with kernel coding style.

Thanks, but this is not how you send a v2.
Please read Documentation/process/submitting-patches.rst.

> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Unless I am mistaken, Christophe merely pointed out a bug in
your first submission, he did not suggest this patch.

> Signed-off-by: Dishank Jogi <jogidishank503@gmail.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
