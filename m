Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816483;
	b=O8wCLTu3zijS/glvZrrw9lF7o9w6n4IFRC7qDdJoDAk3PaYvGPPs+8kSBWvcfE4bYyUJ
	 oh3bDcSPY6IdLQQO0myykD7IMvDQvsUEGfkTwPrQvUwTZl/sL+onU7yeC5VHCkfPRNrWN
	 GJccWmVPKklU3qFeS2b1txqv99zSmMu8dVo5+bjUvSo7Vd17tG5gCo1XwqrxsjMcngz/+
	 dixWYHu3/PvakpB32Inh9UlQOpeF/n8qS+RxRWIaOOCGcMrhvjXfOGOYArvCC2tXDw3OF
	 qSWK7A/k7TmnVqt1lX20GCMxHdxEvjyVb6qiiRlBRfk4P7TwS0to+aTGGjnPPVO+ZFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816483;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=BJaT7K8KaiJhcjDqbR1lXPJHNEkhTK+tqSjAnuCcFOQ=;
	b=CFiwv9wqVjWe/LUXsKClKKNTSsnQA6zKDvF3fP6kqWsZTCL/eTab3s32zLfLCO+cXWhA
	 SsRQomAoyLa2maSGD7hYrra2wPsIJ9hon5kr17O0Ph4iqaOZv7eXNLLTdeHWLOTN8PWxA
	 Pmqari7rdCoCV9BVSFKQOpwo5F1Cj6s5Lip/l59Xj8dLc1Pj1MWzmxJojcJQW3RG46W1l
	 hXByRS/SFULdvBwT1QslZP8z89/kxkIRN14ZSSRPoy9xOCn9CVJl7grhy2lYVRO5FCx9J
	 h75p7rLhVTJdIqY6fFujcwkYlA25u5ODBbOmE+YkIQY0S0QuTy10rXTq7QRjdHotX1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0WYxQsg;
	arc=none smtp.remote-ip=172.234.252.31
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45ED16083624
	for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Nov 2026 18:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45ED16083624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0WYxQsg
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 055F443DF2;
	Wed,  4 Nov 2026 18:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572BE1F00A21;
	Wed,  4 Nov 2026 18:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816481;
	bh=BJaT7K8KaiJhcjDqbR1lXPJHNEkhTK+tqSjAnuCcFOQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D0WYxQsgU5wwYyL7i8yv4iGPaEIWRIKFUIuR107iFvpxmU5mLezX6sYtxMur6SFZO
	 xyqP3tWN+lAs3q8BvxWsNeNugJQTYiqORHGhOY0LohR5tOMUhrTg8WRfs8MBcduQEn
	 WK1mzwba7TKQJlX8JeTI1BseuzDeMmS8NYnWhzNvSmaf/OZI7K4BYBhx9eUQJOPUjW
	 AQ5ccqdrXTdKYJxSElg2BBiE3nprYkFWV1b6RAmStqcoDYXopeEPqhWwCCry9F7Kzd
	 X7PTBXXJzdvZon/j4g0t3ADKMoXkYXWM7Ul2mWPXRTeQezUormWf6QCsJhWRe27+m0
	 rinVEQZ2CcCCw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 04 Nov 2026 18:20:23 +0000
Subject: [PATCH v5 05/11] kbuild: batch module finalisation
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Post: <mailto:linux-m68k@vger.kernel.org>
List-Help: <mailto:linux-m68k+help@vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-m68k+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-build-speedup-v5-5-0f6018be8dae@kernel.org>
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
In-Reply-To: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: ljs@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4985; i=ljs@kernel.org;
 h=from:subject:message-id; bh=HpLpT9Gs9oe3UrzigFy9kl5OJUqyWCNjPtAocROtEf8=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJel+cGth5hynVJ271A9BMDR0DU/K2uOQ9/cAW2SZV+n
 Hy0Y3VpRykLgxgXg6yYIsvzL+L7g0TC5nVe8HeDmcPKBDKEgYtTACbCcJWRoUVrQtuvZqMF0zNt
 2F/bz7HY5d70cUFRve6EF8sMAro1RRj+8Ldu0Pr5JP571GmlR25PzKYGhO0MmBfxcsI9+SmHA70
 S+QE=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

With the .mod.S change in place, module finalisation on allmodconfig builds
consists of a large number of very short-lived jobs.

For allmodconfig x86-64 this can be on the order of ~22,000 jobs of a few
milliseconds in duration each.

Each job entails processing ~22k .cmd files, so the combination of heavy
overhead and small individual job results in a lot of unnecessary and
repeated work even with all cores being utilised.

The solution is to batch by a number of jobs. Determining which value makes
sense was done empirically.

On a 128-thread threadripper box doing an allmodconfig build, best of
2, *.ko, *.mod.o deleted each time:

    modules per chunk    instances    wall
    -----------------    ---------    ------
                    1        11171    10.22s
                    2         5586     6.72s
                    4         2793     4.97s
                    8         1397     4.26s
                   16          699     4.05s
                   32          350     4.05s
                   64          175     4.07s
                  128           88     4.05s
                  256           44     4.03s
                  512           22     4.18s

Wall time flattens for 16-256 module batches.

A slower/lower core machine will do better with fewer modules-per-batch, a
faster/higher core machine will do better with more modules-per-batch.

Therefore, take the midpoint which works in the most margin in either
direction - 128 modules per batch.

This naturally scales with module count too as the optimum gains are
obtained with higher module count, so fewer batches in this case costs less
overhead.

Each instance holds only its own modules' variables and the top-level one
reads no per-module .cmd files at all, the same rules serve both levels,
and an instance is told its chunk with modfinal-first=<index>.

Only the top-level instance builds .module-common.o, to the chunks it is a
plain prerequisite, so no two instances ever write it.

"make modules" with every *.mod.o and *.ko deleted goes from 28.9s to 15.9s
with clang 22. No-op "make modules" goes from 5.6s to 4.8s, as checking the
22,000 targets is spread over the chunks too.

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 allmodconfig, no-op make, gcc         2.3s     1.4s    -0.85s (-38%)
  x86 allmodconfig, no-op make, clang       2.8s     1.8s    -0.94s (-34%)
  x86 allmodconfig, clean, gcc            306.6s   294.1s     -12.6s (-4%)
  x86 allmodconfig, clean, clang          290.2s   283.9s     -6.4s (-2%)

Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 scripts/Makefile.modfinal | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 75e9effdf02c..4d5e6e1a0ff9 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -13,9 +13,30 @@ include $(srctree)/scripts/Makefile.lib
 # find all modules listed in modules.order
 modules := $(call read-file, modules.order)
 
+modfinal-chunk-size := 128
+
+ifdef modfinal-first
+
+# this instance handles the chunk of modules.order starting at $(modfinal-first)
+modules := $(wordlist $(modfinal-first), $(words $(modules)), $(modules))
+modules := $(wordlist 1, $(modfinal-chunk-size), $(modules))
+
 __modfinal: $(modules:%.o=%.ko)
 	@:
 
+else
+
+modfinal-chunks := $(addprefix chunk-, $(shell seq 1 $(modfinal-chunk-size) $(words $(modules))))
+
+PHONY += $(modfinal-chunks)
+$(modfinal-chunks): .module-common.o
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal modfinal-first=$(@:chunk-%=%)
+
+__modfinal: $(modfinal-chunks)
+	@:
+
+endif
+
 # modname and part-of-module are set to make c_flags define proper module flags
 modname = $(notdir $(@:.mod.o=))
 part-of-module = y
@@ -29,8 +50,11 @@ quiet_cmd_as_mod_o = AS [M]  $@
 %.mod.o: %.mod.S FORCE
 	$(call if_changed,as_mod_o)
 
+# Built by the top-level instance alone, the chunks take it as a plain file.
+ifndef modfinal-first
 .module-common.o: $(srctree)/scripts/module-common.c FORCE
 	$(call if_changed_rule,cc_o_c)
+endif
 
 ifneq ($(WARN_ON_UNUSED_TRACEPOINTS),)
 cmd_check_tracepoint = $(objtree)/scripts/tracepoint-update --module $<;
@@ -58,7 +82,11 @@ ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 endif
 	+$(call cmd,check_tracepoint)
 
-targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) .module-common.o
+ifdef modfinal-first
+targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o)
+else
+targets += .module-common.o
+endif
 
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------

-- 
2.56.0

