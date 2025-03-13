Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D77F269CF5
	for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 16:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881967; cv=none; b=uRPDIiD4WXQuTMh459t9/ujxliUD9hi6ij2ZiUjsbaFF/CUiu49LpRarJteES9d6xwyhFli3UNi0Rv0hjePDFYqE1a4+wwh4dgAqT2aW9hLz6FVx2/0xq/MVKjjcNhfjgfBjxzOH6m1CRvPv9RyoARpuOq2fN/oUIORiWk0Bq00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881967; c=relaxed/simple;
	bh=9Qz1HoeN3eOou3Eoi4V3CxaJyhSdwyst6GwzX+KW2lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXL93vhQy7RhdRqOfxA43+Wp4D2RDJjBy08RrS+yTWVm3jAKYrr3B6PrRp2VZjmEk7N5jGqWk24bRSM337TBiAh6jepXrjCPo3VdM1dYo3VPdMs9XboJeUbTTuY8vht+aFyxmXX/V9jpq7uZoYykYHsXk92vJSYQRV5Lk+qTfpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A9NwfYhA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A9NwfYhA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso10625575e9.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 13 Mar 2025 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741881963; x=1742486763; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HZvPdaIqRtWzMsbUSWcLTIHwxLYbx+aQlE3dkPDF7Q=;
        b=A9NwfYhAgtr0K89Kjd0mZqsm5YeORJnp3j830wxtbLpbTFoLTddZgYlx7WJFEsawdY
         yMRBab3cVeaphCxfDzSf481y9tQGg75wiE+wkC02u0YFNwPAvDCzx7RgWnGkTQztSNVJ
         AJy2KLAlRzLz32vbqRbxRVhz23BNZwbzPL13u54w8uIyXnVYTVgMbO3FUQTJQycHRE/R
         4DyylyRaIb70T0uULIMoiNRxoVR+brxxYuME3crU8amYiwUD8yHw+RkKqXbzkC4FLP5s
         Gx2+eKMvTvS3hrpQM+OjTJci6XQlmgRXqqpvQkha+Sbr2iOxrx0ihJCvyLCNCfx12m9B
         VL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741881963; x=1742486763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HZvPdaIqRtWzMsbUSWcLTIHwxLYbx+aQlE3dkPDF7Q=;
        b=gw881FXkegjOvst7yQ3aRBSEaHaUaBaRTvdhQq5327wS3t4lc+YoEr0s4ipNOqHzVk
         vKbBZ5/ZhQ5ZOpBk2aYJDET5rXOfxUgEk0tZxXAjiECmw9w6jJyIlHrYZ9tlOmxJIZki
         ekWZLHfoavaPs+3NZnJ1Mvi4nU/OEkjEJ6OKZFHuNCEL33/8L9dbKAjRiVDU4QTNK+SI
         /wYLMO9UPkSQG6GxFuX4KbsvpaCtJjz5qEPUWe/rXzuivuQXiIAuev49M3PET4bGU735
         VM2yiWp6X4aU/235fxxGuVHvk1oV1l/4DqLJzFuZ/c17pTB6SxT1Gpd+ZIFrQNbtk0ga
         U5iw==
X-Forwarded-Encrypted: i=1; AJvYcCXLWTa2xLcDwMFevGGCbheDGO/ToMgZtJm6GSEC8JkSh9lgEU0nj9G4H4udLPUIJlTyimJbFRpUVEU2@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yww5uthWNKhjrs6xoJllmKKgrrbXgSUG1DtFcWtCjte0jxjNKeX
	756mIgzEKs+IjPcWTYIHocCMdr6C1z348dHtlrFKqiScbeazvxxahYl4WAKKrCc=
X-Gm-Gg: ASbGncuc+oj0gxErdjYmgUUlMH2DTxf1ng2kAYHF3SOUm7lxUicQOXo4jc+UMXsCfxs
	m9kmDukJoo9Qu85Rvp3Ac6pbYCJsLM6Rcz9OhG+WYbpwAh6j9ZUtao1GbcsxP5nJ1eNIlaoObSR
	617cjHCn/SGlZNcFM1Y3WD5pnm15RpdiDNOTTQXPcxPlE74/8J+N7cL1+QQFD7lvMuCr3WzCqHO
	6ySQDXuLbu5ICnAYYcTKHWZN2hOIUUHydYCgZl0XqgjxE2eAmu9Kb0BNgQ0DAcXT0L3CuPkSVDL
	DzbAUsYeXBy9gnfNEstGVE9VyTX80I+rby2hPQ43tFm24wNJmIaZ9w6+oQ==
X-Google-Smtp-Source: AGHT+IEQgvgSedwxIKGl9SiZ4df69QimUI+L/qJr9u7Y58J1gpKQcf9TTsptlOEMUHLXVau4Wsbqng==
X-Received: by 2002:a05:600c:1f81:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-43d1d8cb061mr1985145e9.17.1741881963106;
        Thu, 13 Mar 2025 09:06:03 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a74cdedsm60150725e9.11.2025.03.13.09.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:06:02 -0700 (PDT)
Date: Thu, 13 Mar 2025 17:06:00 +0100
From: Petr Mladek <pmladek@suse.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>,
	David Gow <davidgow@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: [PATCH v6 0/3] printf: convert self-test to KUnit
Message-ID: <Z9MCaPagUM7KC26x@pathway.suse.cz>
References: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com>

On Fri 2025-03-07 17:08:55, Tamir Duberstein wrote:
> This is one of just 3 remaining "Test Module" kselftests (the others
> being bitmap and scanf), the rest having been converted to KUnit.
> 
> I tested this using:
> 
> $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=1 printf
> 
> I have also sent out a series converting scanf[0].
> 
> Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-386d7c3ee714@gmail.com/T/#u [0]
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

For the entire patchset:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
