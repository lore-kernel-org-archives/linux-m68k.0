Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3923A21CC75
	for <linux-m68k@lists.linux-m68k.org>; Fri,  7 Mar 2025 16:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364643; cv=none; b=hceE7JzjYUJP2GXTmuwOLM2sYfAMbUWJkzdDjn0Zgiu1Np2LXOAHdf/Pdj/NLY46QDDWYZZiMGxANqWQz5guATjvFWznOYgFUaiHIEJ4lks9aPbXCVcUOj4WkB5aBbIuxZ2yN25Y2DNgJ39bRr8ifyc6atsNMHVv+uR98DM9iRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364643; c=relaxed/simple;
	bh=mXtKy6AqPJTsyZQnFb8LDOzMrVCF8Jxpd5iGHDtoCGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FkfNAho4bxYS1hC6wXOd+xKbEyKulARANPaxhOKROu5RHH0PASyurkYOtuyLurl2egfJJ5HzUF7GtDjOd4sfPrrK2o118MX5pDMYXR2ztKk5tQo5g2kOne+7XS9sZOOFBHiCjc+HAQaQwETGIFgTYVQLtJn778B2eInSc6uoiO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LeVOAD3H; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LeVOAD3H"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912baafc58so1385298f8f.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 07 Mar 2025 08:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741364638; x=1741969438; darn=lists.linux-m68k.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qFC22TuZGe+bG1f5l5pg/Qemq+Rum0/SnOpCdO9V/4E=;
        b=LeVOAD3HeXFNzw02SjoxHtFi6miZQS0ggduq/rK/3QQoTMz+CwsMa9vX6ye6RsTsAa
         V/Qz92hqVZ88w+Dsnuv6H9sIJz5MtCt6VLgNEO6N7B80Nnv3yUo8pDMPqPqamrgj9fth
         lWs8JN+7e+jK3WkU6wQ9ZSTC7l1z13HhBSPPi+L/ucAKp4TuJSU8nJdS7UbQK2wJI5Tp
         PdmpcbAokbqY4qiUYWP/wOpUoF/h9iCiF81IHKqgDwcFmS3qIyCpMXhinjGb8mkthpgK
         xy2lxG5wUicYXf6tvjYri5n+2tLigxqijxTT9ykbDQuiKqinEExXV7i2p2F3ySqsX5Sg
         7N/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364638; x=1741969438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFC22TuZGe+bG1f5l5pg/Qemq+Rum0/SnOpCdO9V/4E=;
        b=GAQlvpnVOOd+U+/ezrGO2P6a70O751SCFTOEIlMdcjncGDspRAOpXZlVfCbGBTtady
         1sJjWQtm5cAwjMGdOvRezgP6cYeN5MNLSTqkkepqnLkyWvfVktSakjDFJELNdCujVJq7
         RyOYPjWA04BfNoPlEBaEDxIFRRhTSPA3LRavM2bF9zDtpz/iIIy3iHB1+rlh1D5LtFMH
         ErX4SHBXWkI56z41FQHQEJ4YCXrItbxivcfo3todp0/vCS9KPO6C3fDgrwu8Ug4KuzlI
         HJ+WfFeU9txzr3Ed+ZGf4Y7eUGbESq6faWRhvLQW3NHzO0iik9E6IhRzWKnmjsv8wWct
         hazQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsGUzUM3LlWrLkws7osocfzPzXNoQh4YCMIGB+w/6FvdxCcCd7AjH0Qo1b/K6d+EX8vDTOu3bSmUUA@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yy/geP6EgQcZjH4tnS1VwCtMRXC0tfJGDAOS+Fh6XSopPrYe18I
	OYJYxBuATUGM9EbcXRp59HR/nkJFNZKHeBwH62wd87PukWK4E+SJUW3G07HKpZg=
X-Gm-Gg: ASbGncteDz2FC6rdTMCnX2b5DtwUTUKEBlKl3wbz0eJoUNBFqMDHFYI4Lk8HNsQg6tj
	LMh8tbl6kid4t7NJ2231Q9NsEOeEM79ZR+MdGz/TupLuYvWriQupFvD5eBkQNl3OhZyjleQjcX1
	YPLyYzvYLqVNo+Snf+62vksc/+CWH2NAGJxxNB6lY7ymqH+/pULxDKcBwH6XqUv2J7MKNF3VKZ2
	gKTHP8kmK/GOlY+wSuXgp0/s0DHE/wD1Ut/sfGYl+jhj4mm0NRPA5FhStEEhNcKorMz4rBEnUxk
	UK/bZoUlDXLlIjtz+mNa/04vSFDmuORU50e4EqfhcqtbMO0=
X-Google-Smtp-Source: AGHT+IHn0r2Cn/E3lALMkI80pL0QtaTbm6Rd+OGBd1NolTMQ0z7qv14g2CG0Lk8XXwV55vp2Eib2dA==
X-Received: by 2002:a5d:64ed:0:b0:390:f55b:ba91 with SMTP id ffacd0b85a97d-39132d4e369mr2759140f8f.14.1741364638354;
        Fri, 07 Mar 2025 08:23:58 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103035sm5731100f8f.88.2025.03.07.08.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:57 -0800 (PST)
Date: Fri, 7 Mar 2025 17:23:55 +0100
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
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 3/3] printf: implicate test line in failure messages
Message-ID: <Z8sdm7Nhk4h3hoUq@pathway.suse.cz>
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-3-5db840301730@gmail.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-printf-kunit-convert-v5-3-5db840301730@gmail.com>

On Fri 2025-02-21 15:34:32, Tamir Duberstein wrote:
> This improves the failure output by pointing to the failing line at the
> top level of the test, e.g.:
>       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:103
>   lib/printf_kunit.c:167: vsnprintf(buf, 256, "%#-12x", ...) wrote '0x1234abcd  ', expected '0x1234abce  '
>       # test_number: EXPECTATION FAILED at lib/printf_kunit.c:142
>   lib/printf_kunit.c:167: kvasprintf(..., "%#-12x", ...) returned '0x1234abcd  ', expected '0x1234abce  '
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Just for record. I like this improvement. But  I am going to wait for the
next version of the patchset which is going to add back the trailing '\n'.

Best Regards,
Petr
