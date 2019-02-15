From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/4] fbdev: atafb: Stop printing virtual screen_base
Date: Fri, 15 Feb 2019 09:58:58 +0100
Message-ID: <20190215085901.21479-2-geert@linux-m68k.org>
References: <20190215085901.21479-1-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190215085901.21479-1-geert@linux-m68k.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Schmitz <schmitzmic@gmail.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-m68k@vger.kernel.org

UHJpbnRpbmcgKGhhc2hlZCkgdmlydHVhbCBhZGRyZXNzZXMgaXMgdXNlbGVzcy4KClNpZ25lZC1v
ZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Ci0tLQogZHJp
dmVycy92aWRlby9mYmRldi9hdGFmYi5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvYXRhZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXRhZmIuYwppbmRleCBmY2QyZGQ2NzBh
NjU4ZmUzLi5lOWQzMWE0Mjk5ZWU5OTAxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2F0YWZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdGFmYi5jCkBAIC0zMTc1LDggKzMx
NzUsOCBAQCBpbnQgX19pbml0IGF0YWZiX2luaXQodm9pZCkKIAkJCWtlcm5lbF9zZXRfY2FjaGVt
b2RlKHNjcmVlbl9iYXNlLCBzY3JlZW5fbGVuLAogCQkJCQkgICAgIElPTUFQX1dSSVRFVEhST1VH
SCk7CiAJCX0KLQkJcHJpbnRrKCJhdGFmYjogc2NyZWVuX2Jhc2UgJXAgcGh5c19zY3JlZW5fYmFz
ZSAlbHggc2NyZWVuX2xlbiAlZFxuIiwKLQkJCXNjcmVlbl9iYXNlLCBwaHlzX3NjcmVlbl9iYXNl
LCBzY3JlZW5fbGVuKTsKKwkJcHJpbnRrKCJhdGFmYjogcGh5c19zY3JlZW5fYmFzZSAlbHggc2Ny
ZWVuX2xlbiAlZFxuIiwKKwkJICAgICAgIHBoeXNfc2NyZWVuX2Jhc2UsIHNjcmVlbl9sZW4pOwog
I2lmZGVmIEFUQUZCX0VYVAogCX0gZWxzZSB7CiAJCS8qIE1hcCB0aGUgdmlkZW8gbWVtb3J5IChw
aHlzaWNhbCBhZGRyZXNzIGdpdmVuKSB0byBzb21ld2hlcmUKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
