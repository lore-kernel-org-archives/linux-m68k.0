Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103DB22DA1F
	for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755848525; cv=none; b=NUSMLynRN4SBBfpzKR0OYvl/y8G0X6NvbDOSw9/S2byedYATEY+bblprHetJfPLQ7Pc2kmblIwpV2GNDyAqh301E+TRbFZ3KPdDfPNt2H/kCk7F0tfQkbtiCaox/ix68S4mKi4WOUmDkA90YVfqhWF/KqtjmzaF1dvZIotASmiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755848525; c=relaxed/simple;
	bh=biq7g7P/KRpRgpdMxNmBozQASvQKI5dxn7QJVAH/v2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P206e3OCgWWmAiwHbaAParcRotn0ce5QK8o2xX5wUmO4WfN1nV1eGe5tLNt4gNPyc3Bx4tceBHmAZwokFkR9nuCwLFVU9spqdJcGJyzKuA/6Dfm8giySjGKZC5LkbDCJ+NdbvWnwhSB/umskw1XTTXm5EIBQ/2+IxcxI/6wHc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-50e2e0ce5f3so2081995137.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 00:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755848523; x=1756453323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRiFa3bc2FYZmMf6yVpAauhkjxhUWZHH66Nilp4P784=;
        b=QCbo0MU1B/BzR9KIQiakszxT9uyWGznLGUtkO6aIe3s1gnJXBr3YBprtHZiXCES4TU
         joUXpPutriheVvywj6xHNHPb8nqvuVgu+1UmjvsdAdzt4hxMVh+WQxW4z0XL2Niw3s5c
         Dphobpn4CA/HWFMP+w8GSX/MulxQ6IoOyok5U/FbmGCME/gJQGPAdlCalEk2Op0FaDAK
         JDAqkH+GBsSko/zkFiuBmaOKvwUIE5QGGc5SF+JuSwzwKjGujus2wS4CK9XQINvF6HAk
         baXZlClhl0MpdmcQGPlRT4Yf//OpxzSRJvs2F5JE0MiCHMkcmMdVdYbioqZQqs2aUGFf
         xPnA==
X-Gm-Message-State: AOJu0YzMMmmJ3ebcoAo4w6YhgVoTglthJUBw/MC/4SLA0OhkV7Sy3Fk6
	T8Ge/rP5gXJrcjdFjVKkipuxuYGQNuP9xMBvO6mMn713DWOu10abTGnR+hn4aior
X-Gm-Gg: ASbGnctqxs7eGODIRwoAAIgKovCFUwbK/VHW8GJ5tA/KVwl8HAiTauLsCaXHk6rd2tl
	nno+WMJ7YKAnsU8QZB2BjfYdDL/o9r1cXZ4Pe7ALqsSu5hEE+T8hbRLyeWAHA2Lg+34ZiQGdW19
	BF4hAkY56TcWzbVaN2BVQoCGLe1ebO8VLl2Lepy9zBv1N24Hz+WRAfXak8L9TopDVZefstBwbzg
	GVcC4b+U+IKiJ42HvfUayJCibmXNZ1IhyDjC1zHlIZD1j8Prmg+zOdHglOkJU41DYhAoX5IZq1y
	9diUs5hh+1Vlv/zYUzyxTm2htyGERYuk6XJCuQwpfdbDfENcx4mRyEEHBXXP73j9PrDHMq9xMnM
	bnDWxWn9vkk7Hn3vInVe6EXoFwXyuU7eJsWzuE2eT8v/VO3xn/vIX+yOjgryD8mUZ
X-Google-Smtp-Source: AGHT+IEaBOe1VyJUsnly+THlR21SkoSJ5M2qMLxowBrZ4bpDDD/4iilnUkGRRS7XsRV4e3xoz0jVXw==
X-Received: by 2002:a05:6102:5988:b0:4df:9281:5ec3 with SMTP id ada2fe7eead31-51d14730db2mr534631137.2.1755848522709;
        Fri, 22 Aug 2025 00:42:02 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-51bedd3804dsm748497137.12.2025.08.22.00.42.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 00:42:02 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-53b09878addso2270537e0c.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 22 Aug 2025 00:42:02 -0700 (PDT)
X-Received: by 2002:a05:6122:3673:b0:53a:d808:1ff2 with SMTP id
 71dfb90a1353d-53c7d598d3fmr1339996e0c.1.1755848522327; Fri, 22 Aug 2025
 00:42:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <92518308-c763-4591-96ef-6b38c5d8f434@helsinkinet.fi> <CAMuHMdWrQOv-7TWQ2Aj6XXq1E_+_gbCda1AyRJ1vOKo7sXXt8g@mail.gmail.com>
In-Reply-To: <CAMuHMdWrQOv-7TWQ2Aj6XXq1E_+_gbCda1AyRJ1vOKo7sXXt8g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Aug 2025 09:41:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsP7tFD1X2adhz1AyRtgwhmx-6YFXfOEiVmaXHKhLbKA@mail.gmail.com>
X-Gm-Features: Ac12FXzpzQDqxj9OAjb_7RW_qWcbhqCe24Lza2AozNtpUS9JkHJlAfqmADnTmjw
Message-ID: <CAMuHMdXsP7tFD1X2adhz1AyRtgwhmx-6YFXfOEiVmaXHKhLbKA@mail.gmail.com>
Subject: Re: v6.16 console issues on Atari Falcon
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Aug 2025 at 09:35, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 21 Aug 2025 at 22:06, Eero Tamminen <oak@helsinkinet.fi> wrote:
> > With v6.16 kernel I'm getting following when booting kernel on
> > (emulated) 32Mhz Atari Falcon (or Atari TT), to "init" script / Busybox
> > shell (on a 4MB EXT2 IDE file system):
> > ----------------------------------------------------------------
> > Run /init as init process
> >    with arguments:
> >      /init
> >    with environment:
> >      HOME=/
> >      TERM=linux
> >      BOOT_IMAGE=vmlinux
> > ------------[ cut here ]------------
> > WARNING: CPU: 0 PID: 6 at ./include/linux/hung_task.h:48
> > __down_common+0xb4/0x1ce
>
> Thanks, bisected and reported
> https://lore.kernel.org/CAMuHMdXR72M+oiJ_WmuHC0Xkq2m4=zqhP8DtW40mHyJTCdS+ew@mail.gmail.com

Oops,
https://lore.kernel.org/CAMuHMdW7Ab13DdGs2acMQcix5ObJK0O2dG_Fxzr8_g58Rc1_0g@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
