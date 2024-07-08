Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDDD849C
	for <linux-m68k@lists.linux-m68k.org>; Mon,  8 Jul 2024 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720425174; cv=none; b=mt7ffVm9MkYRrs+AngeiZCZBm4Zxjrxi2M/ZE5GUL6WES13US1zrgJjhPAq4pQ2xEKm63Hz6oG742oo8fHY5Qwiu77HsCsrRKnNV/aQ/wJGIh1D8UtOdpbXSDV2zb0g1IhPHapl4Vr0am0SYeSCSERJHpOrPkUhQIm1eYYGph3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720425174; c=relaxed/simple;
	bh=ZfHW5ORT7XRzcUKfRQooCszf25nFi1jIGLevVygjuRI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y71HdZYTid8r9viJEtxwm2AC5YaXeHYdm9v6sPRlXgmpYuRvr4dUQtlTUvErh8SB4sQXJ1sxxtQfx1e4w8TWt55jPS+uiHdcGO15YzpVh9aB+6NECzgkKiyYobDZfTUTPM5P91m/UFtkU1nVPmuyt8KwBZtZlkZjCcQFQUWzaaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=wXM8F324; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="wXM8F324"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee871fd456so3784891fa.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 08 Jul 2024 00:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1720425169; x=1721029969; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMzImep6xXcG1FqSzXqaB7PgKUzLlMXPs4ycuRjSr0k=;
        b=wXM8F324Wc9sKDYJkiRu8rrNGD6P3CaHdvAQNjFCOrEkFo0IOXl6DgrVH2B9SMYl0/
         p/sf6nIDD+rPYCZZZKqs0ryDKB0aa26558Z3mp3fmYuyeM3LYKZKh9Loetlnx4OGyz1j
         zJ7qbdpNkUeRtVxo3UXKWci6mLPL/yMFuW7d/K1vlmqgWaV/6T2XZbIAwLZXLikVVVWO
         tk99aSb6BnMl9fjpy4ktJ8M124K0CuHgtwjRLm47vRAotMc1ppHDWkSk/I7sqZ5vltzB
         Mt750QC4d+rXrN9KnK/N6N84dQemWs/IkjEGGdMYzirMTy6zuqX+gjCl3euF+g0tshQV
         4iGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720425169; x=1721029969;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMzImep6xXcG1FqSzXqaB7PgKUzLlMXPs4ycuRjSr0k=;
        b=iQMtIP1cYUVFifGk0/eun3abh97QM1JBRIItywuF5kjBYecWBKqbOtocE7Mg/zRdmT
         4D6fJjPitbmkOjhyLrEhRssGeOrX1TPm2ZHB3A3DaHd6yiCy+I4U09slP9/7redQeElr
         ZEnUq0WJm69cZQU7bDaSOFqsNuQtS7d8HIE9nrD0swZPLn28m8614WYl51DgEVJvQ1D+
         r2yXThMA+tcI0pulwGm4UZ3XiOWLVlTig3btfJFL3AXAPLtj+KoNC7bd+VkkCpJLkXrG
         VhzrW3DbvdQPZtMbuF89Mgv5YM2GUwaxgrLz2c/rYWM7+4AYphWIvfmHiWN9/hNlMnhO
         nZzw==
X-Forwarded-Encrypted: i=1; AJvYcCU+3Vv+TMJcNLv3xhNItQUSppwHnxyJCVQ//Jhu1l2cp4pPKW/fpod1QYI6oLUuwnQ7eh3pj188Rq5wgFOia75ppWOQmhmuJOJgUFHR1SR9
X-Gm-Message-State: AOJu0Yz9EAyTWqUDC1qorj1ysv3nFXlm1DzAf3OJa1bnBG6sfDqzR+tl
	1HGuvQxjNe7LftsBrn46QfZuDNg9pQ5zLHhCYc9KX+glvTqLU2vosk5SjoOeMhU=
X-Google-Smtp-Source: AGHT+IF3T7f31ZJ4Mx7HP/jTJqQaeYo/dymdJ107qP3vvORyiIRo8c3L1vdrMw5ECn3l2NYvwc6aAA==
X-Received: by 2002:a2e:8ed9:0:b0:2ed:59fa:551e with SMTP id 38308e7fff4ca-2ee8edff698mr67592251fa.4.1720425169089;
        Mon, 08 Jul 2024 00:52:49 -0700 (PDT)
Received: from [127.0.0.1] (87-52-80-167-dynamic.dk.customer.tdc.net. [87.52.80.167])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee8481aac1sm15375011fa.21.2024.07.08.00.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 00:52:48 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 linux-m68k@lists.linux-m68k.org, linux-block@vger.kernel.org
In-Reply-To: <20240706075228.2350978-1-hch@lst.de>
References: <20240706075228.2350978-1-hch@lst.de>
Subject: Re: add a bvec_phys helper v3
Message-Id: <172042516810.332984.1933565483350043014.b4-ty@kernel.dk>
Date: Mon, 08 Jul 2024 01:52:48 -0600
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0


On Sat, 06 Jul 2024 09:52:16 +0200, Christoph Hellwig wrote:
> this series adds a bvec_phys helper to get the physical address
> of a bio_vec so that callers don't have to poke into bvec internals.
> There aren't a whole lot of user of it yet, but with the new proposed
> DMA mapping API we might grow a lot more soon.
> 
> Changes since v2:
>  - keep the existing (somewhat weird) description of get_max_segment_size
> 
> [...]

Applied, thanks!

[1/2] block: add a bvec_phys helper
      (no commit info)
[2/2] block: pass a phys_addr_t to get_max_segment_size
      (no commit info)

Best regards,
-- 
Jens Axboe



