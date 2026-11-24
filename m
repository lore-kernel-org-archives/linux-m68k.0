Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522836;
	b=K5mKlKjlRzEOod5MGM4DwAcvmDtI9FsZ5Gyn2Izgdh9RBScLGKAAXPwiMG5Btr2vKexh
	 waTRs55/oS0SSsOZJREk0AJV5ylMKl7q3OMvtbEmzvr9u82Tv3bDOKR3Qk6U80mogcfga
	 lbWdAYgcHwKYW0FIFb7QEncHzZnl7hokgWp7bEHEZtL9agzxeb0qPkGwdeJ8aH6Vd4cyE
	 gFxLjlrwKZ7x38khtGom1nhuQ/OYC7yq2uBny22izuTkOZEc5jLdvFq8imM54jEf9eQuL
	 IVQwTde1TIMbgyXYHxeidZdt6LJb+QWDsaNmBrXZAPSRU4JYg68trG5cl5xYsMo7gOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522836;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=KXyTN4hgKjRG5cSaTTCW55kZQR4hUGwZ0zYquUwFryQ=;
	b=Iniq3TSCFx8iFA6Dd1V/GgVkOv2NaEySdfAEwdkPhjoyTlz3sqMwhwqHLhYobinG52qB
	 0HhgyrObSTH5SfRjeweIAbHkomWg6oVSDqNYCHCiOLGc/0gG1UjuG04oa4UX8Q8iHhwaF
	 kWIL2bIAsaGZSfHZIgGZzIsllHc5rQP4XBhbSFGNDXlkQWC78cByeeymrIN0nkfN5C1Iv
	 qS5MhICzDbsMHk/lBd8aIIAUkLu4a69L6S5zAoeGe8t/YSPFB5MzevpWNNhs1JETD5IUn
	 1mmCTDCZ+KJ5tBBLlo9KwO04jdEs3jePPWbyhyEBJ/whGLTebcAl9vT/7QImS2a4GHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.org;
	spf=pass smtp.mailfrom=kernel.org;
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jTsKQSeg;
	arc=none smtp.remote-ip=172.105.4.254
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE62606A338
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Nov 2026 12:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE62606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jTsKQSeg
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 506FA61F8D;
	Tue, 24 Nov 2026 12:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647101F000D0;
	Tue, 24 Nov 2026 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522833;
	bh=KXyTN4hgKjRG5cSaTTCW55kZQR4hUGwZ0zYquUwFryQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jTsKQSegckGMUzUiDrJfF6X5qD90wA2YzVrKWRyEBw9cDi0RIsTdDvE/8EhjEbr5x
	 jnR/FhL3Y9hrGwlfqLiB+5ujDM6AQjHJlxJQdVfU/eLbPpKZugIBUU5NKOmvRXU7M4
	 d3j8YExe7W0ZnajGiU5VjshFfKBC6hbkZMy6QNNthHxpsu6ZOH9QNXCK+ZAUIZgg6u
	 k64zF3033NFYAXE8LyRBSRuhdC6qEjghhJeIaiER1fUy83spfoTfNf8XfKnT94C7F/
	 0RN0o3L3Ixb2zj+K3l5Cm9rIqkK9kK0hWkngL47MRVrrz9JuE0u3HeSVCnZtHeY8rM
	 I9mKPXU165Sdg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 24 Nov 2026 12:20:11 +0000
Subject: [PATCH v6 1/7] kbuild: calculate list, composite object state per
 object
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
Message-Id: <20261124-build-speedup-v6-1-141a4f861c67@kernel.org>
References: <20261124-build-speedup-v6-0-141a4f861c67@kernel.org>
In-Reply-To: <20261124-build-speedup-v6-0-141a4f861c67@kernel.org>
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
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Nicolas Schier <n.schier@fritz.com>, Kees Cook <kees@kernel.org>
Cc: ljs@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-m68k@lists.linux-m68k.org, linux-modules@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3607; i=ljs@kernel.org;
 h=from:subject:message-id; bh=q8kD1OuubqsSyKV0BCLYpZ1YDIXvR9hKxAeKGrqIaOw=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJZG/7tP1C8eMZSzZzuKZke8imSCxiWG+b1nFIVX/egM
 DtFsvt4RykLgxgXg6yYIsvzL+L7g0TC5nVe8HeDmcPKBDKEgYtTACZyJJ6Roanu64nL6TuvcQvZ
 /Hjs/e909efLWntVJBc6Lpy3zeps1x5GhvmpbbvS93+y0FHlDau+Icz4+2tanJaKtfaC3waH/kz
 M4gUA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

When each object's command line is expanded, kbuild has to figure out on
multiple occasions whether it's built-in or part of a module and which
composite object it belongs to.

This causes the time spent on each directory in the kernel tree to grow
O(n^2) with its object count, which is especially problematic for instance
in drivers/gpu/drm/amd/amdgpu with 310 objects.

No-op builds (i.e. make -j $(nproc) when nothing has changed) are
particularly impacted by this.

Fix the issue by calculating this data once and looking it up thereafter
instead of recomputing it over and over again.

This has a particularly large impact on allmodconfig builds.

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 defconfig, no-op make, gcc            1.1s     1.1s    -0.02s (-2%)
  x86 defconfig, no-op make, clang          1.3s     1.3s    -0.01s (-1%)
  x86 allmodconfig, no-op make, gcc        15.3s    14.5s    -0.83s (-5%)
  x86 allmodconfig, no-op make, clang      16.2s    15.5s    -0.65s (-4%)
  x86 allmodconfig, touch mm/vma.c, gcc    35.0s    34.3s    -0.77s (-2%)
  x86 allmodconfig, touch mm/vma.c, clang  33.7s    33.2s    -0.51s (-2%)

Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Reviewed-by: Kees Cook <kees@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 scripts/Makefile.build | 8 ++++++++
 scripts/Makefile.lib   | 7 +++----
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6127feb970c6..bbe9555c47a8 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -122,6 +122,14 @@ multi-obj-m	:= $(addprefix $(obj)/, $(multi-obj-m))
 subdir-ym	:= $(addprefix $(obj)/, $(subdir-ym))
 endif
 
+# Cache which list each object is in and which composite objects it belongs to,
+# once per object for $(part-of-builtin), $(part-of-module) and $(modname-multi).
+$(foreach o, $(real-obj-y) $(lib-y), $(eval part-of-builtin_$o := y))
+$(foreach o, $(real-obj-m), $(eval part-of-module_$o := y))
+$(foreach m, $(multi-obj-ym), \
+	$(foreach o, $(call suffix-search, $m, .o, -objs -y -m), \
+		$(eval modname-multi_$o += $(m:.o=))))
+
 ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 19e96b30a122..8936925d4d50 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -2,8 +2,7 @@
 
 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, list them all.
-modname-multi = $(sort $(foreach m,$(multi-obj-ym),\
-		$(if $(filter $*.o, $(call suffix-search, $m, .o, -objs -y -m)),$(m:.o=))))
+modname-multi = $(sort $(modname-multi_$*.o))
 
 __modname = $(or $(modname-multi),$(basetarget))
 
@@ -149,8 +148,8 @@ endif
 # If $(is-kernel-object) is 'y', this object will be linked to vmlinux or modules
 is-kernel-object = $(or $(part-of-builtin),$(part-of-module))
 
-part-of-builtin = $(if $(filter $(basename $@).o, $(real-obj-y) $(lib-y)),y)
-part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
+part-of-builtin = $(part-of-builtin_$(basename $@).o)
+part-of-module = $(part-of-module_$(basename $@).o)
 quiet_modtag = $(if $(part-of-module),[M],   )
 
 modkern_cflags =                                          \

-- 
2.56.1

